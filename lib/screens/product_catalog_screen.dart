import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import '../l10n/generated/app_localizations.dart';
import '../core/theme/app_theme.dart';
import '../models/product.dart';
import '../providers/product_provider.dart';
import '../providers/currency_settings_provider.dart';

class ProductCatalogScreen extends StatefulWidget {
  const ProductCatalogScreen({super.key});

  @override
  State<ProductCatalogScreen> createState() => _ProductCatalogScreenState();
}

class _ProductCatalogScreenState extends State<ProductCatalogScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductProvider>().loadProducts();
    });
  }

  void _showProductForm({Product? product}) {
    final l10n = AppLocalizations.of(context)!;
    final controllerNombre = TextEditingController(text: product?.nombre ?? '');
    final controllerPrecio =
        TextEditingController(
          text: product != null ? product.precio.toStringAsFixed(2) : '',
        );
    final controllerCategoria =
        TextEditingController(text: product?.categoria ?? '');
    String moneda = product?.moneda ?? 'USD';

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.cardColor,
        title: Text(
          product != null ? l10n.catalog_edit_product : l10n.catalog_new_product,
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controllerNombre,
                      decoration: InputDecoration(
                        labelText: l10n.catalog_product_name_label,
                        hintText: l10n.catalog_product_name_hint,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.qr_code_scanner),
                    onPressed: () => _scanQrForForm(controllerNombre, controllerPrecio),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextField(
                controller: controllerPrecio,
                decoration: InputDecoration(labelText: l10n.catalog_product_price_label),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[\d.]'))],
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: moneda,
                decoration: InputDecoration(labelText: l10n.catalog_product_currency_label),
                dropdownColor: AppTheme.cardColor,
                items: ctx.read<CurrencySettingsProvider>().displaySequence
                    .map(
                      (m) => DropdownMenuItem(value: m, child: Text(m)),
                    )
                    .toList(),
                onChanged: (v) => moneda = v ?? 'USD',
              ),
              const SizedBox(height: 12),
              TextField(
                controller: controllerCategoria,
                decoration: InputDecoration(
                  labelText: l10n.catalog_category_label,
                  hintText: l10n.catalog_category_hint,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.cancel_button),
          ),
          ElevatedButton(
            onPressed: () async {
              final nombre = controllerNombre.text.trim();
              final precioTxt = controllerPrecio.text.trim();
              if (nombre.isEmpty || precioTxt.isEmpty) return;

              final precio = double.tryParse(precioTxt);
              if (precio == null || precio <= 0) return;

              final categoria = controllerCategoria.text.trim();
              final provider = context.read<ProductProvider>();

              if (product != null) {
                await provider.updateProduct(
                  product.copyWith(
                    nombre: nombre,
                    precio: precio,
                    moneda: moneda,
                    categoria: categoria.isNotEmpty ? categoria : null,
                  ),
                );
              } else {
                await provider.addProduct(
                  nombre: nombre,
                  precio: precio,
                  moneda: moneda,
                  categoria: categoria.isNotEmpty ? categoria : null,
                );
              }

              if (ctx.mounted) Navigator.pop(ctx);
            },
            child: Text(product != null ? l10n.catalog_save : l10n.catalog_add),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteProduct(Product product) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.cardColor,
        title: Text(l10n.catalog_delete_title),
        content: Text(l10n.catalog_delete_confirm(product.nombre)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel_button),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.delete_button),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      await context.read<ProductProvider>().deleteProduct(product.id);
    }
  }

  void _scanQrForForm(TextEditingController nombreController, TextEditingController precioController) {
    final l10n = AppLocalizations.of(context)!;
    var done = false;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text(l10n.scan_product),
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: MobileScanner(
            onDetect: (capture) {
              if (done) return;
              done = true;
              final barcodes = capture.barcodes;
              if (barcodes.isEmpty || barcodes.first.rawValue == null) {
                done = false;
                return;
              }
              final data = barcodes.first.rawValue!;
              final parts = data.split('|');
              if (parts.length < 2) {
                done = false;
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l10n.invalid_qr), backgroundColor: Colors.red),
                  );
                }
                return;
              }
              final nombre = parts[0].trim();
              final precio = double.tryParse(parts[1].trim());
              if (nombre.isEmpty || precio == null || !precio.isFinite || precio <= 0) {
                done = false;
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l10n.invalid_qr), backgroundColor: Colors.red),
                  );
                }
                return;
              }
              nombreController.text = nombre;
              precioController.text = precio.toStringAsFixed(2);
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();

    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text(l10n.catalog_title),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showProductForm(),
          ),
        ],
      ),
      body: provider.loading
          ? const Center(child: CircularProgressIndicator())
          : provider.products.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.inventory_2,
                          size: 64, color: Colors.grey[600]),
                      const SizedBox(height: 16),
                      Text(
                        l10n.catalog_no_products,
                        style: TextStyle(
                            fontSize: 18, color: Colors.grey[400]),
                      ),
                      const SizedBox(height: 8),
                      TextButton.icon(
                        onPressed: () => _showProductForm(),
                        icon: const Icon(Icons.add),
                        label: Text(l10n.catalog_add_first),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: provider.products.length,
                  itemBuilder: (context, index) {
                    final product = provider.products[index];
                    final symbol = _monedaSymbol(product.moneda);
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.shopping_bag,
                              color: AppTheme.primaryColor),
                        ),
                        title: Text(product.nombre,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600)),
                        subtitle: product.categoria != null
                            ? Text(product.categoria!,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[500]))
                            : null,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '$symbol${product.precio.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(product.moneda,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[500])),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: const Icon(Icons.edit, size: 18),
                              onPressed: () =>
                                  _showProductForm(product: product),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete,
                                  size: 18, color: Colors.red),
                              onPressed: () => _deleteProduct(product),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showProductForm(),
        child: const Icon(Icons.add),
      ),
    );
  }

  String _monedaSymbol(String codigo) {
    switch (codigo) {
      case 'USD':
        return '\$';
      case 'EUR':
        return '€';
      case 'CUP':
        return '\$';
      case 'MLC':
        return 'MLC ';
      case 'SAT':
        return '';
      default:
        return '\$';
    }
  }
}
