import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import '../l10n/generated/app_localizations.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../core/theme/app_theme.dart';

class CatalogQrImportScanner extends StatefulWidget {
  const CatalogQrImportScanner({super.key});

  @override
  State<CatalogQrImportScanner> createState() => _CatalogQrImportScannerState();
}

class _CatalogQrImportScannerState extends State<CatalogQrImportScanner> {
  final Map<int, List<dynamic>> _parts = {};
  int? _totalParts;
  String _status = '';
  bool _processing = false;

  void _onDetect(BarcodeCapture capture) {
    if (_processing) return;
    final barcodes = capture.barcodes;
    if (barcodes.isEmpty || barcodes.first.rawValue == null) return;
    _processing = true;

    try {
      final data = jsonDecode(barcodes.first.rawValue!) as Map<String, dynamic>;

      if (data.containsKey('productos') && !data.containsKey('p')) {
        Navigator.pop(context, data);
        return;
      }

      final p = data['p'] as int;
      final t = data['t'] as int;
      final productos = data['productos'] as List<dynamic>;

      _parts[p] = productos;
      _totalParts = t;

      if (_parts.length >= t) {
        final allProductos = <dynamic>[];
        for (int i = 1; i <= t; i++) {
          if (_parts.containsKey(i)) {
            allProductos.addAll(_parts[i]!);
          }
        }
        Navigator.pop(context, {'productos': allProductos});
        return;
      }

      if (mounted) {
        setState(() {
          _status = '${_parts.length}/$t';
          _processing = false;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _processing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(l10n.scan_product),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          if (_status.isNotEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.green.withValues(alpha: 0.8),
              child: Text(
                '${l10n.catalog_qr_progress(_parts.length, _totalParts ?? 1)}   ${l10n.catalog_qr_scan_button}',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          Expanded(
            child: MobileScanner(onDetect: _onDetect),
          ),
        ],
      ),
    );
  }
}

void showCatalogQrExport({
  required BuildContext context,
  required List<Map<String, dynamic>> products,
}) {
  final rawList = products.map((p) => {
    'nombre': p['nombre'],
    'precio': p['precio'],
    'moneda': p['moneda'],
    'categoria': p['categoria'],
  }).toList();

  final singleJson = jsonEncode({'productos': rawList});

  if (singleJson.length <= 1200) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.cardColor,
        title: Text(AppLocalizations.of(context)!.catalog_qr_export),
        content: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: QrImageView(
            data: singleJson,
            version: QrVersions.auto,
            size: 250,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(AppLocalizations.of(context)!.close),
          ),
        ],
      ),
    );
    return;
  }

  const maxChunkLen = 1100;
  final perItem = rawList.isEmpty ? 0 : (singleJson.length ~/ rawList.length);
  final itemsPerChunk = perItem > 0
      ? ((maxChunkLen - 80) ~/ perItem).clamp(1, rawList.length)
      : rawList.length;
  final totalChunks = (rawList.length / itemsPerChunk).ceil();

  final chunks = <String>[];
  for (int i = 0; i < totalChunks; i++) {
    final start = i * itemsPerChunk;
    final end = (start + itemsPerChunk).clamp(0, rawList.length);
    final sublist = rawList.sublist(start, end);
    chunks.add(jsonEncode({'p': i + 1, 't': totalChunks, 'productos': sublist}));
  }

  showDialog(
    context: context,
    builder: (ctx) => _QrPageDialog(chunks: chunks),
  );
}

class _QrPageDialog extends StatefulWidget {
  final List<String> chunks;
  const _QrPageDialog({required this.chunks});

  @override
  State<_QrPageDialog> createState() => _QrPageDialogState();
}

class _QrPageDialogState extends State<_QrPageDialog> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final chunks = widget.chunks;

    return AlertDialog(
      backgroundColor: AppTheme.cardColor,
      title: Text(l10n.catalog_qr_export),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            l10n.catalog_qr_page(_currentPage + 1, chunks.length),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: QrImageView(
              data: chunks[_currentPage],
              version: QrVersions.auto,
              size: 250,
            ),
          ),
        ],
      ),
      actions: [
        if (_currentPage > 0)
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => setState(() => _currentPage--),
          ),
        if (_currentPage < chunks.length - 1)
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () => setState(() => _currentPage++),
          ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.close),
        ),
      ],
    );
  }
}
