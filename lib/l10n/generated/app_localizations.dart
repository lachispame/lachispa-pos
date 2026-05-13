import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('ja'),
    Locale('pt'),
    Locale('ru'),
  ];

  /// No description provided for @welcome_title.
  ///
  /// In es, this message translates to:
  /// **'La Chispa'**
  String get welcome_title;

  /// No description provided for @welcome_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Punto de Venta Lightning'**
  String get welcome_subtitle;

  /// No description provided for @get_started_button.
  ///
  /// In es, this message translates to:
  /// **'COMENZAR'**
  String get get_started_button;

  /// No description provided for @login_title.
  ///
  /// In es, this message translates to:
  /// **'LaChispaPOS'**
  String get login_title;

  /// No description provided for @login_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Punto de Venta Lightning'**
  String get login_subtitle;

  /// No description provided for @username_label.
  ///
  /// In es, this message translates to:
  /// **'Nombre'**
  String get username_label;

  /// No description provided for @username_placeholder.
  ///
  /// In es, this message translates to:
  /// **'Ingrese su nombre'**
  String get username_placeholder;

  /// No description provided for @username_required_error.
  ///
  /// In es, this message translates to:
  /// **'Ingrese su nombre'**
  String get username_required_error;

  /// No description provided for @select_role.
  ///
  /// In es, this message translates to:
  /// **'Seleccionar Rol'**
  String get select_role;

  /// No description provided for @employee_role.
  ///
  /// In es, this message translates to:
  /// **'Dependiente'**
  String get employee_role;

  /// No description provided for @boss_role.
  ///
  /// In es, this message translates to:
  /// **'Jefe'**
  String get boss_role;

  /// No description provided for @login_button.
  ///
  /// In es, this message translates to:
  /// **'ENTRAR'**
  String get login_button;

  /// No description provided for @scan_qr_button.
  ///
  /// In es, this message translates to:
  /// **'Escanear QR API Key'**
  String get scan_qr_button;

  /// No description provided for @verifying_api_key.
  ///
  /// In es, this message translates to:
  /// **'Verificando API Key...'**
  String get verifying_api_key;

  /// No description provided for @api_key_error.
  ///
  /// In es, this message translates to:
  /// **'Error: Verifique la API Key'**
  String get api_key_error;

  /// No description provided for @invalid_qr.
  ///
  /// In es, this message translates to:
  /// **'QR inválido'**
  String get invalid_qr;

  /// No description provided for @api_key_not_found.
  ///
  /// In es, this message translates to:
  /// **'API Key no encontrada'**
  String get api_key_not_found;

  /// No description provided for @boss_panel_title.
  ///
  /// In es, this message translates to:
  /// **'Panel Jefe'**
  String get boss_panel_title;

  /// No description provided for @import_sales.
  ///
  /// In es, this message translates to:
  /// **'IMPORTAR BD'**
  String get import_sales;

  /// No description provided for @import_sales_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Importar archivo JSON de dependiente'**
  String get import_sales_subtitle;

  /// No description provided for @view_history.
  ///
  /// In es, this message translates to:
  /// **'VER HISTORIAL'**
  String get view_history;

  /// No description provided for @view_history_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Todas las ventas importadas'**
  String get view_history_subtitle;

  /// No description provided for @delete_sales.
  ///
  /// In es, this message translates to:
  /// **'ELIMINAR VENTAS'**
  String get delete_sales;

  /// No description provided for @delete_sales_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Borrar todo el historial'**
  String get delete_sales_subtitle;

  /// No description provided for @delete_imported_db.
  ///
  /// In es, this message translates to:
  /// **'Eliminar BD Importadas'**
  String get delete_imported_db;

  /// No description provided for @delete_all_imported_confirm.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar todas las ventas importadas?'**
  String get delete_all_imported_confirm;

  /// No description provided for @cancel_button.
  ///
  /// In es, this message translates to:
  /// **'Cancelar'**
  String get cancel_button;

  /// No description provided for @delete_button.
  ///
  /// In es, this message translates to:
  /// **'Eliminar'**
  String get delete_button;

  /// No description provided for @import_button.
  ///
  /// In es, this message translates to:
  /// **'Importar'**
  String get import_button;

  /// No description provided for @sales_imported.
  ///
  /// In es, this message translates to:
  /// **'ventas importadas'**
  String get sales_imported;

  /// No description provided for @imported_db_deleted.
  ///
  /// In es, this message translates to:
  /// **'BD eliminadas'**
  String get imported_db_deleted;

  /// No description provided for @employee_name.
  ///
  /// In es, this message translates to:
  /// **'Dependiente'**
  String get employee_name;

  /// No description provided for @total_sales.
  ///
  /// In es, this message translates to:
  /// **'Ventas'**
  String get total_sales;

  /// No description provided for @total_sats_label.
  ///
  /// In es, this message translates to:
  /// **'Total sats'**
  String get total_sats_label;

  /// No description provided for @employee_panel_title.
  ///
  /// In es, this message translates to:
  /// **'Panel de Ventas'**
  String get employee_panel_title;

  /// No description provided for @new_sale.
  ///
  /// In es, this message translates to:
  /// **'NUEVA VENTA'**
  String get new_sale;

  /// No description provided for @new_sale_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Iniciar una nueva venta'**
  String get new_sale_subtitle;

  /// No description provided for @pending_sales.
  ///
  /// In es, this message translates to:
  /// **'VENTAS PENDIENTES'**
  String get pending_sales;

  /// No description provided for @pending_sales_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Ver ventas pendientes'**
  String get pending_sales_subtitle;

  /// No description provided for @total_today.
  ///
  /// In es, this message translates to:
  /// **'Total Hoy'**
  String get total_today;

  /// No description provided for @sales_count.
  ///
  /// In es, this message translates to:
  /// **'Ventas'**
  String get sales_count;

  /// No description provided for @sale_title.
  ///
  /// In es, this message translates to:
  /// **'Nueva Venta'**
  String get sale_title;

  /// No description provided for @add_product.
  ///
  /// In es, this message translates to:
  /// **'Agregar Producto'**
  String get add_product;

  /// No description provided for @product_name.
  ///
  /// In es, this message translates to:
  /// **'Producto'**
  String get product_name;

  /// No description provided for @product_price.
  ///
  /// In es, this message translates to:
  /// **'Precio'**
  String get product_price;

  /// No description provided for @quantity.
  ///
  /// In es, this message translates to:
  /// **'Cantidad'**
  String get quantity;

  /// No description provided for @subtotal.
  ///
  /// In es, this message translates to:
  /// **'Subtotal'**
  String get subtotal;

  /// No description provided for @total.
  ///
  /// In es, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @clear_cart.
  ///
  /// In es, this message translates to:
  /// **'Limpiar'**
  String get clear_cart;

  /// No description provided for @process_sale.
  ///
  /// In es, this message translates to:
  /// **'PROCESAR VENTA'**
  String get process_sale;

  /// No description provided for @sale_processing.
  ///
  /// In es, this message translates to:
  /// **'PROCESANDO...'**
  String get sale_processing;

  /// No description provided for @no_products.
  ///
  /// In es, this message translates to:
  /// **'No hay productos'**
  String get no_products;

  /// No description provided for @scan_product.
  ///
  /// In es, this message translates to:
  /// **'Escanear Producto'**
  String get scan_product;

  /// No description provided for @manual_product.
  ///
  /// In es, this message translates to:
  /// **'Agregar Manual'**
  String get manual_product;

  /// No description provided for @select_currency.
  ///
  /// In es, this message translates to:
  /// **'Moneda'**
  String get select_currency;

  /// No description provided for @currency_usd.
  ///
  /// In es, this message translates to:
  /// **'USD - Dólar'**
  String get currency_usd;

  /// No description provided for @currency_eur.
  ///
  /// In es, this message translates to:
  /// **'EUR - Euro'**
  String get currency_eur;

  /// No description provided for @currency_cup.
  ///
  /// In es, this message translates to:
  /// **'CUP - Peso Cubano'**
  String get currency_cup;

  /// No description provided for @currency_mlc.
  ///
  /// In es, this message translates to:
  /// **'MLC - Moneda Convertible'**
  String get currency_mlc;

  /// No description provided for @mlc_full_name.
  ///
  /// In es, this message translates to:
  /// **'MLC - Moneda Convertible (CBDC)'**
  String get mlc_full_name;

  /// No description provided for @currency_gbp.
  ///
  /// In es, this message translates to:
  /// **'GBP - Libra Esterlina'**
  String get currency_gbp;

  /// No description provided for @currency_cad.
  ///
  /// In es, this message translates to:
  /// **'CAD - Dólar Canadiense'**
  String get currency_cad;

  /// No description provided for @currency_jpy.
  ///
  /// In es, this message translates to:
  /// **'JPY - Yen Japonés'**
  String get currency_jpy;

  /// No description provided for @currency_aud.
  ///
  /// In es, this message translates to:
  /// **'AUD - Dólar Australiano'**
  String get currency_aud;

  /// No description provided for @currency_chf.
  ///
  /// In es, this message translates to:
  /// **'CHF - Franco Suizo'**
  String get currency_chf;

  /// No description provided for @currency_sat.
  ///
  /// In es, this message translates to:
  /// **'SAT - Satoshis'**
  String get currency_sat;

  /// No description provided for @history_title.
  ///
  /// In es, this message translates to:
  /// **'Historial de Ventas'**
  String get history_title;

  /// No description provided for @filter_by_date.
  ///
  /// In es, this message translates to:
  /// **'Filtrar por fecha'**
  String get filter_by_date;

  /// No description provided for @filter_by_employee.
  ///
  /// In es, this message translates to:
  /// **'Filtrar por empleado'**
  String get filter_by_employee;

  /// No description provided for @no_sales.
  ///
  /// In es, this message translates to:
  /// **'No hay ventas'**
  String get no_sales;

  /// No description provided for @export_sales.
  ///
  /// In es, this message translates to:
  /// **'Exportar'**
  String get export_sales;

  /// No description provided for @export_json.
  ///
  /// In es, this message translates to:
  /// **'Exportar JSON'**
  String get export_json;

  /// No description provided for @export_csv.
  ///
  /// In es, this message translates to:
  /// **'Exportar CSV'**
  String get export_csv;

  /// No description provided for @sale_date.
  ///
  /// In es, this message translates to:
  /// **'Fecha'**
  String get sale_date;

  /// No description provided for @sale_employee.
  ///
  /// In es, this message translates to:
  /// **'Empleado'**
  String get sale_employee;

  /// No description provided for @sale_total.
  ///
  /// In es, this message translates to:
  /// **'Total'**
  String get sale_total;

  /// No description provided for @sale_items.
  ///
  /// In es, this message translates to:
  /// **'Productos'**
  String get sale_items;

  /// No description provided for @settings_title.
  ///
  /// In es, this message translates to:
  /// **'Configuración'**
  String get settings_title;

  /// No description provided for @language_settings.
  ///
  /// In es, this message translates to:
  /// **'Idioma'**
  String get language_settings;

  /// No description provided for @currency_settings.
  ///
  /// In es, this message translates to:
  /// **'Monedas'**
  String get currency_settings;

  /// No description provided for @server_settings.
  ///
  /// In es, this message translates to:
  /// **'Servidor'**
  String get server_settings;

  /// No description provided for @about_app.
  ///
  /// In es, this message translates to:
  /// **'Acerca de'**
  String get about_app;

  /// No description provided for @logout.
  ///
  /// In es, this message translates to:
  /// **'Cerrar Sesión'**
  String get logout;

  /// No description provided for @about_title.
  ///
  /// In es, this message translates to:
  /// **'Acerca de LaChispaPOS'**
  String get about_title;

  /// No description provided for @about_version.
  ///
  /// In es, this message translates to:
  /// **'Versión'**
  String get about_version;

  /// No description provided for @about_description.
  ///
  /// In es, this message translates to:
  /// **'Punto de Venta Lightning - Una aplicación para gestionar ventas utilizando Bitcoin a través de Lightning Network.'**
  String get about_description;

  /// No description provided for @pending_sale_title.
  ///
  /// In es, this message translates to:
  /// **'Venta Pendiente'**
  String get pending_sale_title;

  /// No description provided for @pending_sale_message.
  ///
  /// In es, this message translates to:
  /// **'Tienes una venta pendiente:'**
  String get pending_sale_message;

  /// No description provided for @continue_sale.
  ///
  /// In es, this message translates to:
  /// **'Continuar'**
  String get continue_sale;

  /// No description provided for @discard_sale.
  ///
  /// In es, this message translates to:
  /// **'Descartar'**
  String get discard_sale;

  /// No description provided for @error_generic.
  ///
  /// In es, this message translates to:
  /// **'Error'**
  String get error_generic;

  /// No description provided for @success.
  ///
  /// In es, this message translates to:
  /// **'Éxito'**
  String get success;

  /// No description provided for @loading.
  ///
  /// In es, this message translates to:
  /// **'Cargando...'**
  String get loading;

  /// No description provided for @retry.
  ///
  /// In es, this message translates to:
  /// **'Reintentar'**
  String get retry;

  /// No description provided for @confirm.
  ///
  /// In es, this message translates to:
  /// **'Confirmar'**
  String get confirm;

  /// No description provided for @yes.
  ///
  /// In es, this message translates to:
  /// **'Sí'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In es, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @ok.
  ///
  /// In es, this message translates to:
  /// **'Aceptar'**
  String get ok;

  /// No description provided for @save.
  ///
  /// In es, this message translates to:
  /// **'Guardar'**
  String get save;

  /// No description provided for @close.
  ///
  /// In es, this message translates to:
  /// **'Cerrar'**
  String get close;

  /// No description provided for @select_language.
  ///
  /// In es, this message translates to:
  /// **'Seleccionar idioma'**
  String get select_language;

  /// No description provided for @invoice_key_qr_title.
  ///
  /// In es, this message translates to:
  /// **'QR de Clave de Facturación'**
  String get invoice_key_qr_title;

  /// No description provided for @no_invoice_key_configured.
  ///
  /// In es, this message translates to:
  /// **'No hay Invoice Key configurada'**
  String get no_invoice_key_configured;

  /// No description provided for @select_currencies_hint.
  ///
  /// In es, this message translates to:
  /// **'Selecciona las monedas que deseas usar'**
  String get select_currencies_hint;

  /// No description provided for @invoice_qr_title.
  ///
  /// In es, this message translates to:
  /// **'QR Invoice'**
  String get invoice_qr_title;

  /// No description provided for @copy_button.
  ///
  /// In es, this message translates to:
  /// **'Copiar'**
  String get copy_button;

  /// No description provided for @step_connect_1.
  ///
  /// In es, this message translates to:
  /// **'Abre LaChispa (la billetera del owner)'**
  String get step_connect_1;

  /// No description provided for @step_connect_2.
  ///
  /// In es, this message translates to:
  /// **'Menú lateral > QR de Clave de Facturación'**
  String get step_connect_2;

  /// No description provided for @step_connect_3.
  ///
  /// In es, this message translates to:
  /// **'Se mostrará el QR para escanear'**
  String get step_connect_3;

  /// No description provided for @step_connect_4.
  ///
  /// In es, this message translates to:
  /// **'Escanea el QR desde la app POS'**
  String get step_connect_4;

  /// No description provided for @steps_subtitle.
  ///
  /// In es, this message translates to:
  /// **'El QR contiene la URL y la API Key juntos'**
  String get steps_subtitle;

  /// No description provided for @features_title.
  ///
  /// In es, this message translates to:
  /// **'FUNCIONES'**
  String get features_title;

  /// No description provided for @roles_title.
  ///
  /// In es, this message translates to:
  /// **'ROLES'**
  String get roles_title;

  /// No description provided for @how_to_connect.
  ///
  /// In es, this message translates to:
  /// **'CÓMO CONECTAR'**
  String get how_to_connect;

  /// No description provided for @steps_title.
  ///
  /// In es, this message translates to:
  /// **'Pasos para conectar:'**
  String get steps_title;

  /// No description provided for @developed_with.
  ///
  /// In es, this message translates to:
  /// **'Desarrollado con'**
  String get developed_with;

  /// No description provided for @no_sales_to_export.
  ///
  /// In es, this message translates to:
  /// **'No hay ventas para exportar'**
  String get no_sales_to_export;

  /// No description provided for @sales_deleted.
  ///
  /// In es, this message translates to:
  /// **'Ventas eliminadas'**
  String get sales_deleted;

  /// No description provided for @employee.
  ///
  /// In es, this message translates to:
  /// **'Dependiente'**
  String get employee;

  /// No description provided for @delete_sale_confirm.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar esta venta?'**
  String get delete_sale_confirm;

  /// No description provided for @delete_sales_title.
  ///
  /// In es, this message translates to:
  /// **'Eliminar Ventas'**
  String get delete_sales_title;

  /// No description provided for @import_sales_title.
  ///
  /// In es, this message translates to:
  /// **'Importar Ventas'**
  String get import_sales_title;

  /// No description provided for @invalid_price.
  ///
  /// In es, this message translates to:
  /// **'Precio inválido'**
  String get invalid_price;

  /// No description provided for @enter_product_and_price.
  ///
  /// In es, this message translates to:
  /// **'Ingrese producto y precio'**
  String get enter_product_and_price;

  /// No description provided for @empty_cart.
  ///
  /// In es, this message translates to:
  /// **'Carrito vacío'**
  String get empty_cart;

  /// No description provided for @configure_api_in_settings.
  ///
  /// In es, this message translates to:
  /// **'Configure API en Settings'**
  String get configure_api_in_settings;

  /// No description provided for @error_creating_invoice.
  ///
  /// In es, this message translates to:
  /// **'Error creando invoice'**
  String get error_creating_invoice;

  /// No description provided for @payment_received.
  ///
  /// In es, this message translates to:
  /// **'¡Pago recibido!'**
  String get payment_received;

  /// No description provided for @payment_error.
  ///
  /// In es, this message translates to:
  /// **'Error en pago'**
  String get payment_error;

  /// No description provided for @waiting_for_payment.
  ///
  /// In es, this message translates to:
  /// **'Esperando Pago'**
  String get waiting_for_payment;

  /// No description provided for @cobrar.
  ///
  /// In es, this message translates to:
  /// **'COBRAR'**
  String get cobrar;

  /// No description provided for @copiado.
  ///
  /// In es, this message translates to:
  /// **'Copiado'**
  String get copiado;

  /// No description provided for @compartir.
  ///
  /// In es, this message translates to:
  /// **'Compartir'**
  String get compartir;

  /// No description provided for @pending_sale_confirm.
  ///
  /// In es, this message translates to:
  /// **'Tiene una venta pendiente. ¿Desea retomarla?'**
  String get pending_sale_confirm;

  /// No description provided for @retomar.
  ///
  /// In es, this message translates to:
  /// **'Retomar'**
  String get retomar;

  /// No description provided for @discard_confirm.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar todas las ventas importadas?'**
  String get discard_confirm;

  /// No description provided for @pay_with_nfc.
  ///
  /// In es, this message translates to:
  /// **'Pagar con NFC'**
  String get pay_with_nfc;

  /// No description provided for @nfc_not_available.
  ///
  /// In es, this message translates to:
  /// **'NFC no disponible'**
  String get nfc_not_available;

  /// No description provided for @nfc_ready.
  ///
  /// In es, this message translates to:
  /// **'Acerque el dispositivo al cliente'**
  String get nfc_ready;

  /// No description provided for @nfc_payment_cancelled.
  ///
  /// In es, this message translates to:
  /// **'Pago NFC cancelado'**
  String get nfc_payment_cancelled;

  /// No description provided for @nfc_error.
  ///
  /// In es, this message translates to:
  /// **'Error NFC'**
  String get nfc_error;

  /// No description provided for @tap_to_pay.
  ///
  /// In es, this message translates to:
  /// **'Tocar para pagar'**
  String get tap_to_pay;

  /// No description provided for @nfc_reading.
  ///
  /// In es, this message translates to:
  /// **'Leyendo NFC...'**
  String get nfc_reading;

  /// No description provided for @lnurl_error.
  ///
  /// In es, this message translates to:
  /// **'Error del servidor'**
  String get lnurl_error;

  /// No description provided for @drawer_stats.
  ///
  /// In es, this message translates to:
  /// **'ESTADÍSTICAS'**
  String get drawer_stats;

  /// No description provided for @drawer_stats_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Ventas, gráficos y top productos'**
  String get drawer_stats_subtitle;

  /// No description provided for @drawer_catalog.
  ///
  /// In es, this message translates to:
  /// **'CATÁLOGO'**
  String get drawer_catalog;

  /// No description provided for @drawer_catalog_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Gestionar productos'**
  String get drawer_catalog_subtitle;

  /// No description provided for @drawer_import_sales.
  ///
  /// In es, this message translates to:
  /// **'IMPORTAR VENTAS'**
  String get drawer_import_sales;

  /// No description provided for @drawer_import_sales_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Importar ventas de dependientes'**
  String get drawer_import_sales_subtitle;

  /// No description provided for @drawer_export_sales.
  ///
  /// In es, this message translates to:
  /// **'EXPORTAR VENTAS'**
  String get drawer_export_sales;

  /// No description provided for @drawer_export_sales_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Exportar ventas a JSON'**
  String get drawer_export_sales_subtitle;

  /// No description provided for @drawer_import_catalog.
  ///
  /// In es, this message translates to:
  /// **'IMPORTAR CATÁLOGO'**
  String get drawer_import_catalog;

  /// No description provided for @drawer_import_catalog_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Productos del jefe'**
  String get drawer_import_catalog_subtitle;

  /// No description provided for @drawer_delete_imported_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Eliminar ventas importadas'**
  String get drawer_delete_imported_subtitle;

  /// No description provided for @drawer_logout.
  ///
  /// In es, this message translates to:
  /// **'Salir'**
  String get drawer_logout;

  /// No description provided for @catalog_title.
  ///
  /// In es, this message translates to:
  /// **'Catálogo de Productos'**
  String get catalog_title;

  /// No description provided for @catalog_new_product.
  ///
  /// In es, this message translates to:
  /// **'Nuevo Producto'**
  String get catalog_new_product;

  /// No description provided for @catalog_edit_product.
  ///
  /// In es, this message translates to:
  /// **'Editar Producto'**
  String get catalog_edit_product;

  /// No description provided for @catalog_product_name_label.
  ///
  /// In es, this message translates to:
  /// **'Nombre'**
  String get catalog_product_name_label;

  /// No description provided for @catalog_product_name_hint.
  ///
  /// In es, this message translates to:
  /// **'Nombre del producto'**
  String get catalog_product_name_hint;

  /// No description provided for @catalog_product_price_label.
  ///
  /// In es, this message translates to:
  /// **'Precio'**
  String get catalog_product_price_label;

  /// No description provided for @catalog_product_currency_label.
  ///
  /// In es, this message translates to:
  /// **'Moneda'**
  String get catalog_product_currency_label;

  /// No description provided for @catalog_category_label.
  ///
  /// In es, this message translates to:
  /// **'Categoría (opcional)'**
  String get catalog_category_label;

  /// No description provided for @catalog_category_hint.
  ///
  /// In es, this message translates to:
  /// **'Ej: Bebidas, Comidas'**
  String get catalog_category_hint;

  /// No description provided for @catalog_save.
  ///
  /// In es, this message translates to:
  /// **'Guardar'**
  String get catalog_save;

  /// No description provided for @catalog_add.
  ///
  /// In es, this message translates to:
  /// **'Agregar'**
  String get catalog_add;

  /// No description provided for @catalog_delete_title.
  ///
  /// In es, this message translates to:
  /// **'Eliminar Producto'**
  String get catalog_delete_title;

  /// No description provided for @catalog_delete_confirm.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar \"{productName}\"?'**
  String catalog_delete_confirm(Object productName);

  /// No description provided for @catalog_export_tooltip.
  ///
  /// In es, this message translates to:
  /// **'Exportar catálogo'**
  String get catalog_export_tooltip;

  /// No description provided for @catalog_no_products.
  ///
  /// In es, this message translates to:
  /// **'No hay productos'**
  String get catalog_no_products;

  /// No description provided for @catalog_add_first.
  ///
  /// In es, this message translates to:
  /// **'Agregar primer producto'**
  String get catalog_add_first;

  /// No description provided for @catalog_import_title.
  ///
  /// In es, this message translates to:
  /// **'Importar Catálogo'**
  String get catalog_import_title;

  /// No description provided for @catalog_import_confirm.
  ///
  /// In es, this message translates to:
  /// **'¿Importar {count} productos?'**
  String catalog_import_confirm(Object count);

  /// No description provided for @catalog_imported.
  ///
  /// In es, this message translates to:
  /// **'{count} productos importados'**
  String catalog_imported(Object count);

  /// No description provided for @catalog_invalid_file.
  ///
  /// In es, this message translates to:
  /// **'Archivo de catálogo inválido'**
  String get catalog_invalid_file;

  /// No description provided for @receipt_title.
  ///
  /// In es, this message translates to:
  /// **'Ticket'**
  String get receipt_title;

  /// No description provided for @receipt_brand.
  ///
  /// In es, this message translates to:
  /// **'LA CHISPA'**
  String get receipt_brand;

  /// No description provided for @receipt_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Punto de Venta Lightning'**
  String get receipt_subtitle;

  /// No description provided for @receipt_employee.
  ///
  /// In es, this message translates to:
  /// **'Dependiente'**
  String get receipt_employee;

  /// No description provided for @receipt_date.
  ///
  /// In es, this message translates to:
  /// **'Fecha'**
  String get receipt_date;

  /// No description provided for @receipt_total.
  ///
  /// In es, this message translates to:
  /// **'TOTAL'**
  String get receipt_total;

  /// No description provided for @receipt_sats.
  ///
  /// In es, this message translates to:
  /// **'sats'**
  String get receipt_sats;

  /// No description provided for @receipt_thanks.
  ///
  /// In es, this message translates to:
  /// **'¡Gracias por su compra!'**
  String get receipt_thanks;

  /// No description provided for @receipt_website.
  ///
  /// In es, this message translates to:
  /// **'lachispa.me'**
  String get receipt_website;

  /// No description provided for @receipt_share.
  ///
  /// In es, this message translates to:
  /// **'Compartir Ticket'**
  String get receipt_share;

  /// No description provided for @receipt_new_sale.
  ///
  /// In es, this message translates to:
  /// **'Nueva Venta'**
  String get receipt_new_sale;

  /// No description provided for @receipt_share_tooltip.
  ///
  /// In es, this message translates to:
  /// **'Compartir'**
  String get receipt_share_tooltip;

  /// No description provided for @currency_mismatch_title.
  ///
  /// In es, this message translates to:
  /// **'Monedas diferentes'**
  String get currency_mismatch_title;

  /// No description provided for @currency_mismatch_message.
  ///
  /// In es, this message translates to:
  /// **'No se pueden mezclar monedas en una misma venta. La venta actual está en {currency}. Finalice o cancele la venta actual para cambiar de moneda.'**
  String currency_mismatch_message(Object currency);

  /// No description provided for @got_it.
  ///
  /// In es, this message translates to:
  /// **'Entendido'**
  String get got_it;

  /// No description provided for @manual_entry_tooltip.
  ///
  /// In es, this message translates to:
  /// **'Entrada manual'**
  String get manual_entry_tooltip;

  /// No description provided for @catalog_mode_tooltip.
  ///
  /// In es, this message translates to:
  /// **'Catálogo'**
  String get catalog_mode_tooltip;

  /// No description provided for @search_products_hint.
  ///
  /// In es, this message translates to:
  /// **'Buscar productos...'**
  String get search_products_hint;

  /// No description provided for @no_results_in_currency.
  ///
  /// In es, this message translates to:
  /// **'Sin resultados en {currency}'**
  String no_results_in_currency(Object currency);

  /// No description provided for @no_products_in_currency.
  ///
  /// In es, this message translates to:
  /// **'No hay productos en {currency}'**
  String no_products_in_currency(Object currency);

  /// No description provided for @try_other_currency.
  ///
  /// In es, this message translates to:
  /// **'Prueba con otra moneda'**
  String get try_other_currency;

  /// No description provided for @product_label.
  ///
  /// In es, this message translates to:
  /// **'Producto'**
  String get product_label;

  /// No description provided for @name_hint.
  ///
  /// In es, this message translates to:
  /// **'Nombre'**
  String get name_hint;

  /// No description provided for @price_label.
  ///
  /// In es, this message translates to:
  /// **'Precio'**
  String get price_label;

  /// No description provided for @add_products_hint.
  ///
  /// In es, this message translates to:
  /// **'Agregue productos'**
  String get add_products_hint;

  /// No description provided for @invoice_memo.
  ///
  /// In es, this message translates to:
  /// **'Venta POS - {userName}'**
  String invoice_memo(Object userName);

  /// No description provided for @settings_manual_entry.
  ///
  /// In es, this message translates to:
  /// **'O ingrese manualmente:'**
  String get settings_manual_entry;

  /// No description provided for @settings_url_label.
  ///
  /// In es, this message translates to:
  /// **'URL'**
  String get settings_url_label;

  /// No description provided for @settings_url_hint.
  ///
  /// In es, this message translates to:
  /// **'https://lachispa.me o http://192.168.1.x:5000'**
  String get settings_url_hint;

  /// No description provided for @settings_api_key_label.
  ///
  /// In es, this message translates to:
  /// **'API Key'**
  String get settings_api_key_label;

  /// No description provided for @settings_ticket_section.
  ///
  /// In es, this message translates to:
  /// **'Ticket'**
  String get settings_ticket_section;

  /// No description provided for @settings_ticket_description.
  ///
  /// In es, this message translates to:
  /// **'Tras cada venta puedes compartir el ticket como texto. Más adelante añadiremos soporte para impresora térmica.'**
  String get settings_ticket_description;

  /// No description provided for @stats_title.
  ///
  /// In es, this message translates to:
  /// **'Estadísticas'**
  String get stats_title;

  /// No description provided for @stats_last_7_days.
  ///
  /// In es, this message translates to:
  /// **'Ventas últimos 7 días'**
  String get stats_last_7_days;

  /// No description provided for @stats_top_products.
  ///
  /// In es, this message translates to:
  /// **'Top Productos'**
  String get stats_top_products;

  /// No description provided for @stats_by_employee.
  ///
  /// In es, this message translates to:
  /// **'Por Empleado'**
  String get stats_by_employee;

  /// No description provided for @stats_today.
  ///
  /// In es, this message translates to:
  /// **'Hoy'**
  String get stats_today;

  /// No description provided for @stats_week.
  ///
  /// In es, this message translates to:
  /// **'Semana'**
  String get stats_week;

  /// No description provided for @stats_month.
  ///
  /// In es, this message translates to:
  /// **'Mes'**
  String get stats_month;

  /// No description provided for @stats_no_data.
  ///
  /// In es, this message translates to:
  /// **'Sin datos'**
  String get stats_no_data;

  /// No description provided for @stats_sales_unit.
  ///
  /// In es, this message translates to:
  /// **'ventas'**
  String get stats_sales_unit;

  /// No description provided for @stats_sats_unit.
  ///
  /// In es, this message translates to:
  /// **'sats'**
  String get stats_sats_unit;

  /// No description provided for @total_label.
  ///
  /// In es, this message translates to:
  /// **'TOTAL'**
  String get total_label;

  /// No description provided for @btc_unit.
  ///
  /// In es, this message translates to:
  /// **'BTC'**
  String get btc_unit;

  /// No description provided for @history_ticket.
  ///
  /// In es, this message translates to:
  /// **'Ticket'**
  String get history_ticket;

  /// No description provided for @history_delete.
  ///
  /// In es, this message translates to:
  /// **'Eliminar'**
  String get history_delete;

  /// No description provided for @print_subject.
  ///
  /// In es, this message translates to:
  /// **'Ticket de venta LaChispaPOS'**
  String get print_subject;

  /// No description provided for @print_header.
  ///
  /// In es, this message translates to:
  /// **'LA  CHISPA'**
  String get print_header;

  /// No description provided for @print_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Punto de Venta Lightning'**
  String get print_subtitle;

  /// No description provided for @print_thanks.
  ///
  /// In es, this message translates to:
  /// **'  ¡Gracias por su compra!'**
  String get print_thanks;

  /// No description provided for @print_url.
  ///
  /// In es, this message translates to:
  /// **'  lachispa.me'**
  String get print_url;

  /// No description provided for @export_subject.
  ///
  /// In es, this message translates to:
  /// **'Exportación de ventas POS Lightning'**
  String get export_subject;

  /// No description provided for @export_invalid_json.
  ///
  /// In es, this message translates to:
  /// **'Archivo JSON inválido'**
  String get export_invalid_json;

  /// No description provided for @export_unknown.
  ///
  /// In es, this message translates to:
  /// **'Desconocido'**
  String get export_unknown;

  /// No description provided for @export_imported_name.
  ///
  /// In es, this message translates to:
  /// **'Importado'**
  String get export_imported_name;

  /// No description provided for @export_catalog_subject.
  ///
  /// In es, this message translates to:
  /// **'Catálogo de productos LaChispaPOS'**
  String get export_catalog_subject;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'de',
    'en',
    'es',
    'fr',
    'it',
    'ja',
    'pt',
    'ru',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
