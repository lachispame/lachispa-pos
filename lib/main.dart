import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'l10n/generated/app_localizations.dart';
import 'providers/language_provider.dart';
import 'providers/currency_settings_provider.dart';
import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'providers/sales_provider.dart';
import 'providers/product_provider.dart';
import 'providers/table_provider.dart';
import 'core/theme/app_theme.dart';
import 'core/database/database_helper.dart';
import 'screens/login_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/sale_screen.dart';
import 'screens/history_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/about_screen.dart';
import 'models/sale.dart';
import 'screens/product_catalog_screen.dart';
import 'screens/stats_screen.dart';
import 'screens/receipt_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.database;

  final authProvider = AuthProvider();
  await authProvider.init();

  runApp(POSApp(authProvider: authProvider));
}

class POSApp extends StatelessWidget {
  final AuthProvider authProvider;

  const POSApp({super.key, required this.authProvider});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => CurrencySettingsProvider()),
        ChangeNotifierProvider.value(value: authProvider),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => SalesProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => TableProvider()),
      ],
      child: Builder(
        builder: (context) {
          final languageProvider = context.watch<LanguageProvider>();
          final currencyProvider = context.watch<CurrencySettingsProvider>();

          final serverUrl = authProvider.currentUser?.lndhubUrl ?? '';
          if (serverUrl.isNotEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!currencyProvider.isInitialized) {
                currencyProvider.initialize(serverUrl: serverUrl);
              }
            });
          }

          return MaterialApp(
            title: 'LaChispaPOS',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.darkTheme,
            locale: languageProvider.currentLocale,
            supportedLocales: LanguageProvider.supportedLocales,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            initialRoute: authProvider.isLoggedIn ? '/home' : '/welcome',
            routes: {
              '/welcome': (_) => const WelcomeScreen(),
              '/login': (_) => const LoginScreen(),
              '/home': (_) => const SaleScreen(),
              '/sale': (_) => const SaleScreen(),
              '/history': (_) => const HistoryScreen(),
              '/settings': (_) => const SettingsScreen(),
              '/about': (_) => const AboutScreen(),
          '/catalog': (_) => const ProductCatalogScreen(),
          '/stats': (_) => const StatsScreen(),
          '/receipt': (context) {
            final args = ModalRoute.of(context)?.settings.arguments;
            if (args is Sale) {
              return ReceiptScreen(sale: args);
            }
            return const SaleScreen();
          },
            },
          );
        },
      ),
    );
  }

}
