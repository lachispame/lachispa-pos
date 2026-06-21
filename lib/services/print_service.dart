import 'dart:io';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import '../l10n/generated/app_localizations.dart';
import '../models/sale.dart';

class PrinterConfig {
  String type;
  String? address;
  String? name;

  PrinterConfig({this.type = 'text', this.address, this.name});

  Map<String, dynamic> toJson() => {
    'type': type,
    'address': address,
    'name': name,
  };

  factory PrinterConfig.fromJson(Map<String, dynamic> json) => PrinterConfig(
    type: json['type'] as String? ?? 'text',
    address: json['address'] as String?,
    name: json['name'] as String?,
  );
}

class PrintService {
  static final PrintService instance = PrintService._();
  PrintService._();

  static String _safeSubstring(String s, int max) =>
      s.length <= max ? s : s.substring(0, max);

  Future<void> shareReceipt(Sale sale, AppLocalizations l10n) async {
    final text = generateReceiptText(sale, l10n);
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/ticket_${_safeSubstring(sale.id, 8)}.txt');
    await file.writeAsString(text);
    await Share.shareXFiles(
      [XFile(file.path)],
      text: l10n.print_subject,
    );
  }

  String generateReceiptText(Sale sale, AppLocalizations l10n) {
    final buf = StringBuffer();
    final dateStr = DateFormat('dd/MM/yyyy HH:mm').format(sale.fecha);

    buf.writeln('╔══════════════════════════════╗');
    buf.writeln('║        ${l10n.print_header}            ║');
    buf.writeln('║   ${l10n.print_subtitle}   ║');
    buf.writeln('╠══════════════════════════════╣');
    buf.writeln('║ ${l10n.receipt_employee}: ${sale.userNombre.padRight(16)}║');
    buf.writeln('║ $dateStr           ║');
    if (sale.tableId != null) {
      buf.writeln('║ ${l10n.table_label}: ${sale.tableId!.padRight(20)}║');
    }
    buf.writeln('╠══════════════════════════════╣');

    for (final item in sale.items) {
      final line = ' ${item.cantidad}x ${item.nombre.padRight(16)}';
      final price = '\$${item.subtotalFiat.toStringAsFixed(2)}';
      buf.writeln('║$line$price║');
    }

    buf.writeln('╠══════════════════════════════╣');
    buf.writeln(
      '${'║ ${l10n.receipt_total}:'.padRight(20)}${'\$${sale.totalFiat.toStringAsFixed(2)} ${sale.moneda}'.padLeft(12)}║');
    buf.writeln('${'║ ${sale.totalSats} ${l10n.receipt_sats}'.padRight(30)}║');
    buf.writeln('╠══════════════════════════════╣');
    if (sale.invoiceId != null) {
      buf.writeln('║ ${l10n.print_invoice} ${_safeSubstring(sale.invoiceId!, 16)}...║');
    }
    buf.writeln('╚══════════════════════════════╝');
    buf.writeln(l10n.print_thanks);
    buf.writeln(l10n.print_url);

    return buf.toString();
  }
}
