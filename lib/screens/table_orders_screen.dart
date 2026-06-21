import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../core/constants/currencies.dart';
import '../models/sale.dart';
import '../providers/auth_provider.dart';
import '../providers/sales_provider.dart';
import '../providers/table_provider.dart';
import '../l10n/generated/app_localizations.dart';

class TableOrdersScreen extends StatefulWidget {
  final String tableId;
  const TableOrdersScreen({super.key, required this.tableId});

  @override
  State<TableOrdersScreen> createState() => _TableOrdersScreenState();
}

class _TableOrdersScreenState extends State<TableOrdersScreen> {
  List<Sale> _sales = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _cargar();
  }

  Future<void> _cargar() async {
    final auth = context.read<AuthProvider>();
    final salesProvider = context.read<SalesProvider>();
    try {
      final ventas = await salesProvider.getSalesByTable(
        widget.tableId,
        auth.isJefe ? null : auth.currentUser!.id,
      );
      if (mounted) {
        setState(() {
          _sales = ventas;
          _loading = false;
        });
      }
    } catch (e) {
      debugPrint('TableOrdersScreen._cargar error: $e');
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final tableProvider = context.watch<TableProvider>();
    final pendingItems = tableProvider.itemsForTable(widget.tableId);
    final paidSales = _sales.where((s) => s.estado == 'completada').toList();
    final totalSats = paidSales.fold<int>(0, (s, sale) => s + sale.totalSats) +
        pendingItems.fold<int>(0, (s, i) => s + i.subtotalSats);

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text('${l10n.table_label} ${widget.tableId}'),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Card(
                    color: AppTheme.cardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            _sales.length.toString(),
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            '${totalSats} sats',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (pendingItems.isNotEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                    child: Text(l10n.pending_orders, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                  ),
                  Card(
                    color: Colors.amber.withAlpha(30),
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: pendingItems.map((item) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Text(
                            '${item.nombre} x${item.cantidad} — ${item.subtotalSats} sats',
                            style: const TextStyle(fontSize: 14),
                          ),
                        )).toList(),
                      ),
                    ),
                  ),
                ],
                if (paidSales.isNotEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Text(l10n.paid_orders, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                  ),
                  ...paidSales.map((sale) {
                    final dateStr = DateFormat('dd/MM HH:mm').format(sale.fecha);
                    return Card(
                      color: AppTheme.cardColor,
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      child: ListTile(
                        title: Text(
                          sale.items.map((item) => '${item.nombre} x${item.cantidad}').join(', '),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text('$dateStr · ${sale.totalSats} sats'),
                        trailing: Text(
                          '${Moneda.fromCodigo(sale.moneda).simbolo}${sale.totalFiat.toStringAsFixed(2)}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }),
                ],
                if (pendingItems.isEmpty && _sales.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: Center(
                      child: Text(
                        l10n.no_sales_history,
                        style: const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
