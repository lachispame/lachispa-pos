import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/theme/app_theme.dart';
import '../core/services/lachispa_api_service.dart';
import '../providers/auth_provider.dart';
import '../l10n/generated/app_localizations.dart';
import '../services/print_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _urlController = TextEditingController(text: 'https://lachispa.me');
  final _apiKeyController = TextEditingController();
  bool _showScanApi = false;
  bool _testing = false;
  bool? _connectionOk;

  PrinterConfig _printerConfig = PrinterConfig();
  static const String _printerConfigKey = 'printer_config';

  @override
  void initState() {
    super.initState();
    _loadPrinterConfig();
    final user = context.read<AuthProvider>().currentUser;
    if (user?.lndhubUrl != null) {
      _urlController.text = user!.lndhubUrl!;
    }
    if (user?.lndhubCreds != null) {
      _apiKeyController.text = user!.lndhubCreds!;
    }
  }

  Future<void> _loadPrinterConfig() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_printerConfigKey);
    if (json != null) {
      try {
        final map = jsonDecode(json) as Map<String, dynamic>;
        _printerConfig = PrinterConfig.fromJson(map);
      } catch (_) {}
    }
  }

  Future<void> _savePrinterConfig() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _printerConfigKey,
      const JsonEncoder().convert(_printerConfig.toJson()),
    );
  }

  @override
  void dispose() {
    _urlController.dispose();
    _apiKeyController.dispose();
    super.dispose();
  }

  Future<void> _testConnection() async {
    final l10n = AppLocalizations.of(context)!;
    if (_urlController.text.isEmpty || _apiKeyController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.username_required_error)));
      return;
    }

    setState(() {
      _testing = true;
      _connectionOk = null;
    });

    try {
      LachispaApiService.instance.configure(
        baseUrl: _urlController.text.trim(),
        apiKey: _apiKeyController.text.trim(),
      );

      final ok = await LachispaApiService.instance.testConnection();

      setState(() => _connectionOk = ok);

      if (ok && mounted) {
        final auth = context.read<AuthProvider>();
        await auth.updateLndhub(
          url: _urlController.text.trim(),
          creds: _apiKeyController.text.trim(),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.success), backgroundColor: Colors.green),
        );
      }
    } catch (e) {
      setState(() => _connectionOk = false);
    } finally {
      setState(() => _testing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (_showScanApi) {
      return Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        appBar: AppBar(
          title: Text(l10n.scan_qr_button),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => setState(() => _showScanApi = false),
          ),
        ),
        body: MobileScanner(
          onDetect: (capture) {
            final barcodes = capture.barcodes;
            if (barcodes.isNotEmpty && barcodes.first.rawValue != null) {
              final data = barcodes.first.rawValue!;
              if (data.startsWith('lndhub://')) {
                final uri = Uri.parse(
                  data.replaceFirst('lndhub://', 'lachispa://'),
                );
                _urlController.text = uri.host + uri.path;
                _apiKeyController.text = uri.userInfo;
              } else if (data.startsWith('lachispa://')) {
                final uri = Uri.parse(data);
                _urlController.text = uri.host + uri.path;
                _apiKeyController.text = uri.queryParameters['key'] ?? '';
              } else {
                _apiKeyController.text = data;
                _urlController.text = 'https://lachispa.me';
              }
              setState(() => _showScanApi = false);
              _testConnection();
            }
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(title: Text(l10n.settings_title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.server_settings,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.api_key_not_found,
              style: TextStyle(color: Colors.grey[400]),
            ),
            const SizedBox(height: 24),
            Center(
              child: OutlinedButton.icon(
                onPressed: () => setState(() => _showScanApi = true),
                icon: const Icon(Icons.qr_code_scanner),
                label: Text(l10n.scan_qr_button),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              l10n.settings_manual_entry,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _urlController,
              decoration: InputDecoration(
                labelText: l10n.settings_url_label,
                hintText: l10n.settings_url_hint,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _apiKeyController,
              obscureText: true,
              decoration: InputDecoration(labelText: l10n.settings_api_key_label),
            ),
            const SizedBox(height: 24),
            if (_connectionOk != null)
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: _connectionOk!
                      ? Colors.green.withValues(alpha: 0.2)
                      : Colors.red.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      _connectionOk! ? Icons.check_circle : Icons.error,
                      color: _connectionOk! ? Colors.green : Colors.red,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _connectionOk! ? l10n.success : l10n.error_generic,
                      style: TextStyle(
                        color: _connectionOk! ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _testing ? null : _testConnection,
                child: _testing
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(l10n.save),
              ),
            ),
            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),
            Text(
              l10n.settings_ticket_section,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.receipt, color: AppTheme.primaryColor),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        l10n.settings_ticket_description,
                        style: TextStyle(fontSize: 13, color: Colors.grey[400]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
