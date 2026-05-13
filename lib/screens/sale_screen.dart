import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/theme/app_theme.dart';
import '../core/services/lachispa_api_service.dart';
import '../core/services/nfc_payment_service.dart';
import '../models/product.dart';
import '../core/constants/currencies.dart';
import '../providers/auth_provider.dart';
import '../providers/cart_provider.dart';
import '../providers/sales_provider.dart';
import '../providers/product_provider.dart';
import '../widgets/cart_item_tile.dart';
import '../widgets/total_display.dart';
import '../widgets/currency_selector.dart';
import '../widgets/qr_display.dart';
import '../widgets/app_drawer.dart';
import '../l10n/generated/app_localizations.dart';

class SaleScreen extends StatefulWidget {
  const SaleScreen({super.key});

  @override
  State<SaleScreen> createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  final _productoController = TextEditingController();
  final _precioController = TextEditingController();
  final _searchController = TextEditingController();
  bool _showPaymentSheet = false;
  bool _isReadingNfc = false;
  bool _isCatalogMode = false;
  String _searchQuery = '';
  String? _paymentRequest;
  String? _pendingSaleId;

  final NfcPaymentService _nfcService = NfcPaymentService();

  @override
  void initState() {
    super.initState();
    context.read<ProductProvider>().loadProducts();
    _checkRecoverableCart();
  }

  Future<void> _checkRecoverableCart() async {
    final cartProvider = context.read<CartProvider>();
    await cartProvider.initSession();
    if (cartProvider.hasItems && mounted) {
      _showRecoveryDialog();
    }
  }

  void _showRecoveryDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.cardColor,
        title: Text(l10n.pending_sale_title),
        content: Text(l10n.pending_sale_confirm),
        actions: [
          TextButton(
            onPressed: () {
              context.read<CartProvider>().clearCart();
              Navigator.pop(ctx);
            },
            child: Text(l10n.discard_sale),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.retomar),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _productoController.dispose();
    _precioController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _toggleMode() {
    setState(() => _isCatalogMode = !_isCatalogMode);
  }

  bool _canAddCurrency(String monedaCodigo) {
    final cart = context.read<CartProvider>();
    if (!cart.hasItems) return true;
    return cart.monedaVenta.codigo == monedaCodigo;
  }

  void _showCurrencyMismatchDialog() {
    final l10n = AppLocalizations.of(context)!;
    final cart = context.read<CartProvider>();
    final currencyCode = cart.hasItems ? cart.monedaVenta.codigo : '';
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.cardColor,
        title: Text(l10n.currency_mismatch_title),
        content: Text(
          l10n.currency_mismatch_message(currencyCode),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.got_it),
          ),
        ],
      ),
    );
  }

  void _agregarProducto() async {
    final l10n = AppLocalizations.of(context)!;
    final nombre = _productoController.text.trim();
    final precioTxt = _precioController.text.trim();

    if (nombre.isEmpty || precioTxt.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.enter_product_and_price)));
      return;
    }

    final precio = double.tryParse(precioTxt);
    if (precio == null || precio <= 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.invalid_price)));
      return;
    }

    final cart = context.read<CartProvider>();
    if (!_canAddCurrency(cart.monedaVenta.codigo)) {
      _showCurrencyMismatchDialog();
      return;
    }

    try {
      await cart.addItem(
        nombre: nombre,
        precio: precio,
        cantidad: 1,
      );

      _productoController.clear();
      _precioController.clear();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${l10n.error_generic}: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _agregarProductoFromCatalog(Product product) async {
    final cart = context.read<CartProvider>();
    if (!_canAddCurrency(product.moneda)) {
      _showCurrencyMismatchDialog();
      return;
    }
    if (Moneda.fromCodigo(product.moneda) != cart.monedaVenta) {
      cart.setMoneda(Moneda.fromCodigo(product.moneda));
    }
    await cart.addItem(
      nombre: product.nombre,
      precio: product.precio,
      cantidad: 1,
    );
  }

  Future<void> _crearInvoice() async {
    final l10n = AppLocalizations.of(context)!;
    final cart = context.read<CartProvider>();
    final auth = context.read<AuthProvider>();
    final user = auth.currentUser;
    final salesProvider = context.read<SalesProvider>();

    if (cart.totalSats <= 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.empty_cart)));
      return;
    }

    if (user?.lndhubUrl == null || user?.lndhubCreds == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.configure_api_in_settings)));
      return;
    }

    try {
      LachispaApiService.instance.configure(
        baseUrl: user!.lndhubUrl!,
        apiKey: user.lndhubCreds!,
      );

      final invoice = await LachispaApiService.instance.createInvoice(
        amountSats: cart.totalSats,
        memo: l10n.invoice_memo(user.nombre),
      );

      if (invoice.paymentRequest.isEmpty) {
        throw Exception('Payment request vacío');
      }

      final pendingSaleId = await salesProvider.createPendingSale(
        userId: user.id,
        userNombre: user.nombre,
        items: cart.items,
        totalFiat: cart.totalFiat,
        moneda: cart.monedaVenta.codigo,
        totalSats: cart.totalSats,
        rateUsado: cart.rateUsado,
        invoiceId: invoice.paymentHash,
      );

      _pendingSaleId = pendingSaleId;
      _paymentRequest = invoice.paymentRequest;

      LachispaApiService.instance.connectWebSocket(user.lndhubCreds!);

      setState(() => _showPaymentSheet = true);

      _esperarPago(invoice.paymentHash, pendingSaleId);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${l10n.error_creating_invoice}: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _cobrarConNfc() async {
    final l10n = AppLocalizations.of(context)!;

    final nfcAvailable = await _nfcService.isNfcAvailable();
    if (!nfcAvailable) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.nfc_not_available),
            backgroundColor: Colors.red,
          ),
        );
      }
      return;
    }

    setState(() => _isReadingNfc = true);

    final cart = context.read<CartProvider>();
    final auth = context.read<AuthProvider>();
    final user = auth.currentUser!;

    await _nfcService.readLnurlFromCard(
      onLnurlReceived: (lnurl) async {
        print('LNURL received from card: $lnurl');

        try {
              final invoiceResult = await LachispaApiService.instance
                  .createInvoiceForLnurl(
                    lnurl: lnurl,
                    amountSats: cart.totalSats,
                    memo: l10n.invoice_memo(user.nombre),
                  );

          if (invoiceResult == null) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(l10n.lnurl_error),
                  backgroundColor: Colors.red,
                ),
              );
              setState(() => _isReadingNfc = false);
            }
            return;
          }

          await _nfcService.stopReading();

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(l10n.waiting_for_payment),
                backgroundColor: Colors.green,
              ),
            );
          }

          _esperarPago(invoiceResult.paymentHash, _pendingSaleId!);
        } catch (e) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${l10n.lnurl_error}: $e'),
                backgroundColor: Colors.red,
              ),
            );
            setState(() => _isReadingNfc = false);
          }
          await _nfcService.stopReading();
        }
      },
      onError: (error) async {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${l10n.nfc_error}: $error'),
              backgroundColor: Colors.red,
            ),
          );
          setState(() => _isReadingNfc = false);
        }
        await _nfcService.stopReading();
      },
    );
  }

  Future<void> _esperarPago(String paymentHash, String saleId) async {
    final l10n = AppLocalizations.of(context)!;
    final cart = context.read<CartProvider>();
    final salesProvider = context.read<SalesProvider>();

    try {
      await for (final settled in LachispaApiService.instance.watchPayment(
        paymentHash,
      )) {
        if (!mounted) return;

          if (settled) {
            await salesProvider.markSaleAsCompleted(saleId);

            final sale = await salesProvider.getSaleById(saleId);

            await cart.clearCart();
            LachispaApiService.instance.disconnect();

            if (mounted) {
              setState(() {
                _showPaymentSheet = false;
                _isReadingNfc = false;
                _pendingSaleId = null;
              });

              if (sale != null && mounted) {
                Navigator.pushReplacementNamed(
                  context,
                  '/receipt',
                  arguments: sale,
                );
              } else {
                Navigator.of(context).popUntil((route) => route.isFirst);
              }
            }
            return;
          }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${l10n.payment_error}: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final cart = context.watch<CartProvider>();

    if (_showPaymentSheet && _paymentRequest != null) {
      return Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        appBar: AppBar(title: Text(l10n.waiting_for_payment)),
        body: Center(
          child: QrDisplay(
            paymentRequest: _paymentRequest!,
            totalFiat: cart.totalFiat,
            totalSats: cart.totalSats,
            onPayWithNfc: () {
              setState(() {
                _showPaymentSheet = false;
              });
              _cobrarConNfc();
            },
            onCancel: () {
              setState(() => _showPaymentSheet = false);
              LachispaApiService.instance.disconnect();
            },
          ),
        ),
      );
    }

    if (_isReadingNfc) {
      return Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        appBar: AppBar(
          title: Text(l10n.waiting_for_payment),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () async {
              await _nfcService.stopReading();
              setState(() => _isReadingNfc = false);
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.nfc, size: 100, color: Color(0xFFF0A500)),
              const SizedBox(height: 24),
              Text(
                l10n.nfc_ready,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '${cart.totalFiat.toStringAsFixed(2)} ${cart.monedaVenta.codigo}',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF0A500),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${cart.totalSats} sats',
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text(l10n.sale_title),
        actions: [
          IconButton(
            icon: Icon(_isCatalogMode ? Icons.edit : Icons.store),
            tooltip: _isCatalogMode ? l10n.manual_entry_tooltip : l10n.catalog_mode_tooltip,
            onPressed: _toggleMode,
          ),
          if (!_isCatalogMode && cart.hasItems)
            IconButton(
              icon: const Icon(Icons.delete_sweep),
              onPressed: () => cart.clearCart(),
            ),
        ],
      ),
      drawer: const AppDrawer(),
      body: _isCatalogMode
          ? _buildCatalogMode(cart, l10n)
          : _buildDirectMode(cart, l10n),
    );
  }

  Widget _buildCatalogMode(CartProvider cart, AppLocalizations l10n) {
    final productProvider = context.watch<ProductProvider>();
    final currencyCode = cart.monedaVenta.codigo;

    final productsInCurrency = productProvider.products
        .where((p) => p.moneda == currencyCode)
        .toList();
    final filtered = _searchQuery.isEmpty
        ? productsInCurrency
        : productsInCurrency
            .where((p) =>
                p.nombre.toLowerCase().contains(_searchQuery.toLowerCase()))
            .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: l10n.search_products_hint,
              prefixIcon: const Icon(Icons.search),
            ),
            onChanged: (v) => setState(() => _searchQuery = v),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CurrencySelector(
            selected: cart.monedaVenta,
            onChanged: cart.hasItems
                ? (m) {
                    if (m.codigo != cart.monedaVenta.codigo) {
                      _showCurrencyMismatchDialog();
                    }
                  }
                : (m) => cart.setMoneda(m),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: filtered.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.inventory_2,
                          size: 48, color: Colors.grey[600]),
                      const SizedBox(height: 12),
                      Text(
                        productProvider.products.any(
                                (p) => p.moneda == currencyCode)
                            ? l10n.no_results_in_currency(currencyCode)
                            : l10n.no_products_in_currency(currencyCode),
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                      if (!productProvider
                          .products.any((p) => p.moneda == currencyCode))
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            l10n.try_other_currency,
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[600]),
                          ),
                        ),
                    ],
                  ),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.6,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final p = filtered[index];
                    final symbol = _monedaSymbol(p.moneda);
                    return Card(
                      child: InkWell(
                        onTap: () => _agregarProductoFromCatalog(p),
                        borderRadius: BorderRadius.circular(16),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                p.nombre,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '$symbol${p.precio.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: AppTheme.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
        if (cart.hasItems) _buildBottomBar(cart, l10n),
      ],
    );
  }

  Widget _buildDirectMode(CartProvider cart, AppLocalizations l10n) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: TextField(
                  controller: _productoController,
                  decoration: InputDecoration(
                    labelText: l10n.product_label,
                    hintText: l10n.name_hint,
                  ),
                  onSubmitted: (_) => _agregarProducto(),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _precioController,
                  decoration: InputDecoration(labelText: l10n.price_label),
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => _agregarProducto(),
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filled(
                onPressed: _agregarProducto,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CurrencySelector(
            selected: cart.monedaVenta,
            onChanged: cart.hasItems
                ? (m) {
                    if (m.codigo != cart.monedaVenta.codigo) {
                      _showCurrencyMismatchDialog();
                    }
                  }
                : (m) => cart.setMoneda(m),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: cart.hasItems
              ? ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final item = cart.items[index];
                    return CartItemTile(
                      nombre: item.nombre,
                      precioUnitario: item.precioUnitario,
                      moneda: item.moneda,
                      cantidad: item.cantidad,
                      subtotal: item.subtotalFiat,
                      subtotalSats: item.subtotalSats,
                      onDecrement: item.cantidad > 1
                          ? () =>
                                cart.updateQuantity(index, item.cantidad - 1)
                          : null,
                      onIncrement: () =>
                          cart.updateQuantity(index, item.cantidad + 1),
                      onDelete: () => cart.removeItem(index),
                    );
                  },
                )
              : Center(
                  child: Text(
                    l10n.add_products_hint,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
        ),
        if (cart.hasItems) _buildBottomBar(cart, l10n),
      ],
    );
  }

  Widget _buildBottomBar(CartProvider cart, AppLocalizations l10n) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TotalDisplay(
          totalFiat: cart.totalFiat,
          moneda: cart.monedaVenta.codigo,
          totalSats: cart.totalSats,
          rateUsado: cart.rateUsado,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _crearInvoice,
              icon: const Icon(Icons.payment),
              label: Text(l10n.cobrar),
            ),
          ),
        ),
      ],
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
