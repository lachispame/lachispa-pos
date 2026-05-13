import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/generated/app_localizations.dart';
import '../core/theme/app_theme.dart';
import '../core/constants/app_constants.dart';
import '../core/services/export_service.dart';
import '../providers/language_provider.dart';
import '../providers/currency_settings_provider.dart';
import '../providers/auth_provider.dart';
import '../providers/sales_provider.dart';
import '../providers/product_provider.dart';
import '../core/database/database_helper.dart';

class AppDrawer extends StatelessWidget {
  final VoidCallback? onLanguageChanged;

  const AppDrawer({super.key, this.onLanguageChanged});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final languageProvider = context.watch<LanguageProvider>();
    final currencyProvider = context.watch<CurrencySettingsProvider>();
    final authProvider = context.watch<AuthProvider>();
    final user = authProvider.currentUser;
    final isJefe = authProvider.isJefe;

    return Drawer(
      backgroundColor: AppTheme.backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.primaryColor.withValues(alpha: 0.3),
                    AppTheme.primaryColor.withValues(alpha: 0.1),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/Logo/chispabordesredondos.png',
                    height: 60,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'LaChispaPOS',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  if (user != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      '${user.nombre} · ${isJefe ? "Jefe" : "Dependiente"}',
                      style: TextStyle(color: Colors.grey[400], fontSize: 14),
                    ),
                  ],
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _DrawerItem(
                    icon: Icons.history,
                    title: l10n.history_title,
                    subtitle: l10n.view_history_subtitle,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/history');
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.bar_chart,
                    title: l10n.drawer_stats,
                    subtitle: l10n.drawer_stats_subtitle,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/stats');
                    },
                  ),
                  if (isJefe) ...[
                    const Divider(color: Colors.grey),
                    _DrawerItem(
                      icon: Icons.store,
                      title: l10n.drawer_catalog,
                      subtitle: l10n.drawer_catalog_subtitle,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/catalog');
                      },
                    ),
                  ],
                  const Divider(color: Colors.grey),
                  if (isJefe) ...[
                    _DrawerItem(
                      icon: Icons.file_download,
                      title: l10n.drawer_import_sales,
                      subtitle: l10n.drawer_import_sales_subtitle,
                      onTap: () {
                        Navigator.pop(context);
                        _importSales(context);
                      },
                    ),
                  ] else ...[
                    _DrawerItem(
                      icon: Icons.file_upload,
                      title: l10n.drawer_export_sales,
                      subtitle: l10n.drawer_export_sales_subtitle,
                      onTap: () {
                        Navigator.pop(context);
                        _exportSales(context);
                      },
                    ),
                    _DrawerItem(
                      icon: Icons.inventory_2,
                      title: l10n.drawer_import_catalog,
                      subtitle: l10n.drawer_import_catalog_subtitle,
                      onTap: () {
                        Navigator.pop(context);
                        _importCatalog(context);
                      },
                    ),
                    _DrawerItem(
                      icon: Icons.delete_forever,
                      title: l10n.delete_sales,
                      subtitle: l10n.delete_sales_subtitle,
                      onTap: () {
                        Navigator.pop(context);
                        _deleteMySales(context);
                      },
                    ),
                  ],
                  if (isJefe) ...[
                    _DrawerItem(
                      icon: Icons.delete_forever,
                      title: l10n.delete_sales,
                      subtitle: l10n.drawer_delete_imported_subtitle,
                      onTap: () {
                        Navigator.pop(context);
                        _deleteImported(context);
                      },
                    ),
                  ],
                  const Divider(color: Colors.grey),
                  _DrawerItem(
                    icon: Icons.language,
                    title: l10n.language_settings,
                    subtitle: languageProvider.getCurrentLanguageDisplay(),
                    onTap: () => _showLanguageSelector(context),
                  ),
                  _DrawerItem(
                    icon: Icons.attach_money,
                    title: l10n.currency_settings,
                    subtitle: currencyProvider.selectedCurrencies.isNotEmpty
                        ? currencyProvider.selectedCurrencies.join(', ')
                        : l10n.select_currency,
                    onTap: () => _showCurrencySelector(context),
                  ),
                  _DrawerItem(
                    icon: Icons.settings,
                    title: l10n.settings_title,
                    subtitle: l10n.server_settings,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/settings');
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.info_outline,
                    title: l10n.about_app,
                    subtitle: l10n.about_title,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/about');
                    },
                  ),
                  const Divider(color: Colors.grey),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    child: Row(
                      children: [
                        Text(
                          '${l10n.about_version} ${AppConstants.appVersion}',
                          style: TextStyle(color: Colors.grey[600], fontSize: 12),
                        ),
                        const Spacer(),
                        TextButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            authProvider.logout();
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          icon: const Icon(Icons.logout, size: 16, color: Colors.red),
                          label: Text(
                            l10n.drawer_logout,
                            style: TextStyle(color: Colors.red[300], fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _exportSales(BuildContext context) async {
    final salesProvider = context.read<SalesProvider>();
    final authProvider = context.read<AuthProvider>();
    final user = authProvider.currentUser;
    if (user == null) return;

    final l10n = AppLocalizations.of(context)!;
    final sales = await salesProvider.getSalesByUser(user.id);
    if (sales.isEmpty) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.no_sales_to_export)),
        );
      }
      return;
    }

    final totalSats = sales.fold<int>(0, (sum, s) => sum + s.totalSats);
    final exportService = ExportService.instance;
    final json = await exportService.generateJson(
      dependienteId: user.id,
      dependienteNombre: user.nombre,
      ventas: sales,
      totalSats: totalSats,
      appVersion: AppConstants.appVersion,
    );
    await exportService.shareJson(json: json, dependienteNombre: user.nombre);
  }

  Future<void> _importSales(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    try {
      final exportService = ExportService.instance;
      final data = await exportService.pickAndParseJson();
      if (data == null) return;

      final preview = await exportService.getPreview(data);

      if (context.mounted) {
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            backgroundColor: AppTheme.cardColor,
            title: Text(l10n.import_sales_title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${l10n.employee_name}: ${preview.dependienteNombre}'),
                const SizedBox(height: 8),
                Text('${l10n.total_sales}: ${preview.totalVentas}'),
                const SizedBox(height: 8),
                Text('${l10n.total_sats_label}: ${preview.totalSats}'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: Text(l10n.cancel_button),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: Text(l10n.import_button),
              ),
            ],
          ),
        );

        if (confirmed == true) {
          final db = DatabaseHelper.instance;
          final imported = await exportService.importSales(data, db);
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$imported ${l10n.sales_imported}')),
            );
          }
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${l10n.error_generic}: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Future<void> _importCatalog(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final productProvider = context.read<ProductProvider>();
    final data = await productProvider.pickCatalogJson();
    if (data == null) return;

    final productos = data['productos'] as List<dynamic>?;
    if (productos == null || productos.isEmpty) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.catalog_invalid_file), backgroundColor: Colors.red),
        );
      }
      return;
    }

    if (context.mounted) {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          backgroundColor: AppTheme.cardColor,
          title: Text(l10n.catalog_import_title),
          content: Text(l10n.catalog_import_confirm(productos.length)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(l10n.cancel_button),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(l10n.import_button),
            ),
          ],
        ),
      );

      if (confirmed == true && context.mounted) {
        final imported = await productProvider.importCatalogFromJson(data);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.catalog_imported(imported))),
        );
      }
    }
  }

  void _deleteMySales(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.cardColor,
        title: Text(l10n.delete_sales_title),
        content: Text(l10n.delete_all_imported_confirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.cancel_button),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              Navigator.pop(ctx);
              final salesProvider = context.read<SalesProvider>();
              final authProvider = context.read<AuthProvider>();
              await salesProvider.deleteAllSalesByUser(
                authProvider.currentUser!.id,
              );
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(l10n.sales_deleted)),
                );
              }
            },
            child: Text(l10n.delete_button),
          ),
        ],
      ),
    );
  }

  void _deleteImported(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.cardColor,
        title: Text(l10n.delete_imported_db),
        content: Text(l10n.delete_all_imported_confirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.cancel_button),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              Navigator.pop(ctx);
              await context.read<SalesProvider>().deleteAllImportedSales();
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(l10n.imported_db_deleted)),
                );
              }
            },
            child: Text(l10n.delete_button),
          ),
        ],
      ),
    );
  }

  void _showLanguageSelector(BuildContext context) {
    final languageProvider = context.read<LanguageProvider>();
    final l10n = AppLocalizations.of(context)!;
    final languages = languageProvider.getAvailableLanguages();

    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.5,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                l10n.select_language,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final lang = languages[index];
                  return ListTile(
                    leading: Text(
                      lang['flag']!,
                      style: const TextStyle(fontSize: 24),
                    ),
                    title: Text(lang['name']!),
                    trailing:
                        languageProvider.currentLocale.languageCode == lang['code']
                            ? const Icon(Icons.check, color: AppTheme.primaryColor)
                            : null,
                    onTap: () {
                      languageProvider.changeLanguage(Locale(lang['code']!));
                      Navigator.pop(ctx);
                      onLanguageChanged?.call();
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _showCurrencySelector(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final currencyProvider = context.read<CurrencySettingsProvider>();
    final allCurrencies = [
      'USD', 'EUR', 'CUP', 'MLC', 'GBP', 'CAD', 'JPY', 'AUD', 'CHF',
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.cardColor,
      isScrollControlled: true,
      builder: (ctx) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        expand: false,
        builder: (_, scrollController) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                l10n.select_currency,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                l10n.select_currencies_hint,
                style: TextStyle(color: Colors.grey[400], fontSize: 14),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: allCurrencies.length,
                itemBuilder: (_, index) {
                  final currency = allCurrencies[index];
                  final isSelected = currencyProvider.isCurrencySelected(currency);
                  final info = currencyProvider.getCurrencyInfo(currency);

                  return ListTile(
                    leading: Text(
                      info?.flag ?? '💰',
                      style: const TextStyle(fontSize: 24),
                    ),
                    title: Text(info?.name ?? currency),
                    subtitle: Text(currency),
                    trailing: Checkbox(
                      value: isSelected,
                      activeColor: AppTheme.primaryColor,
                      onChanged: (value) {
                        if (value == true) {
                          currencyProvider.addCurrency(currency);
                        } else {
                          currencyProvider.removeCurrency(currency);
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.primaryColor),
      title: Text(title, style: const TextStyle(fontSize: 14)),
      subtitle: subtitle.isNotEmpty
          ? Text(subtitle, style: TextStyle(color: Colors.grey[400], fontSize: 11))
          : null,
      onTap: onTap,
      dense: true,
    );
  }
}
