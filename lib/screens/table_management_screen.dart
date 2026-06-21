import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/theme/app_theme.dart';
import '../providers/table_provider.dart';
import '../l10n/generated/app_localizations.dart';

class TableManagementScreen extends StatefulWidget {
  const TableManagementScreen({super.key});

  @override
  State<TableManagementScreen> createState() => _TableManagementScreenState();
}

class _TableManagementScreenState extends State<TableManagementScreen> {
  final _controller = TextEditingController();
  String? _selectedTable;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final tableProvider = context.watch<TableProvider>();
    final tables = tableProvider.activeTables;

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text(l10n.tables_title),
        actions: [
          if (tableProvider.hasActiveTable)
            TextButton.icon(
              onPressed: () {
                tableProvider.closeTable(tableProvider.currentTable!);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close, size: 18),
              label: Text(l10n.discard_table),
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: l10n.table_label,
                    prefixIcon: const Icon(Icons.table_restaurant),
                  ),
                  onChanged: (v) {
                    final trimmed = v.trim();
                    setState(() => _selectedTable = trimmed.isNotEmpty ? trimmed : null);
                  },
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: _selectedTable != null
                    ? () => Navigator.pop(context, _selectedTable)
                    : null,
                child: Text(l10n.confirm_table),
              ),
            ],
          ),
          if (tables.isNotEmpty) ...[
            const SizedBox(height: 24),
            Text(l10n.tables_active_title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...tables.map((t) => _buildTableCard(t, tableProvider, l10n)),
          ],
        ],
      ),
    );
  }

  Widget _buildTableCard(String table, TableProvider tableProvider, AppLocalizations l10n) {
    final items = tableProvider.itemsForTable(table);
    final itemCount = items.length;
    final totalSats = items.fold<int>(0, (s, i) => s + i.subtotalSats);

    return Card(
      color: AppTheme.cardColor,
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.table_restaurant, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    table,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Text('$totalSats sats · $itemCount ${l10n.sales}'),
              ],
            ),
            if (itemCount > 0) ...[
              const SizedBox(height: 4),
              Text(
                items.map((i) => '${i.nombre} x${i.cantidad}').join(', '),
                style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.receipt_long, size: 18),
                  label: Text(l10n.view_orders),
                  onPressed: () => Navigator.pushNamed(context, '/table-orders', arguments: table),
                ),
                const SizedBox(width: 4),
                TextButton.icon(
                  icon: const Icon(Icons.open_in_new, size: 18),
                  label: Text(l10n.confirm_table),
                  onPressed: () => Navigator.pop(context, table),
                ),
                const SizedBox(width: 4),
                TextButton.icon(
                  icon: const Icon(Icons.delete, size: 18),
                  label: Text(l10n.discard_table),
                  style: TextButton.styleFrom(foregroundColor: Colors.red),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        backgroundColor: AppTheme.cardColor,
                        title: Text('${l10n.discard_table} $table?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(ctx),
                            child: Text(l10n.cancel_button),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(ctx);
                              _closeTable(table, tableProvider);
                            },
                            child: Text(l10n.discard_table),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _closeTable(String table, TableProvider tableProvider) async {
    await tableProvider.closeTable(table);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${AppLocalizations.of(context)!.table_label} $table')),
      );
    }
  }
}
