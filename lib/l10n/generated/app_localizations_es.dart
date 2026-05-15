// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get welcome_title => 'La Chispa';

  @override
  String get welcome_subtitle => 'Punto de Venta Lightning';

  @override
  String get get_started_button => 'COMENZAR';

  @override
  String get login_title => 'LaChispaPOS';

  @override
  String get login_subtitle => 'Punto de Venta Lightning';

  @override
  String get username_label => 'Nombre';

  @override
  String get username_placeholder => 'Ingrese su nombre';

  @override
  String get username_required_error => 'Ingrese su nombre';

  @override
  String get select_role => 'Seleccionar Rol';

  @override
  String get employee_role => 'Dependiente';

  @override
  String get boss_role => 'Jefe';

  @override
  String get login_button => 'ENTRAR';

  @override
  String get scan_qr_button => 'Escanear QR API Key';

  @override
  String get verifying_api_key => 'Verificando API Key...';

  @override
  String get api_key_error => 'Error: Verifique la API Key';

  @override
  String get invalid_qr => 'QR inválido';

  @override
  String get api_key_not_found => 'API Key no encontrada';

  @override
  String get boss_panel_title => 'Panel Jefe';

  @override
  String get import_sales => 'IMPORTAR BD';

  @override
  String get import_sales_subtitle => 'Importar archivo JSON de dependiente';

  @override
  String get view_history => 'VER HISTORIAL';

  @override
  String get view_history_subtitle => 'Todas las ventas importadas';

  @override
  String get delete_sales => 'ELIMINAR VENTAS';

  @override
  String get delete_sales_subtitle => 'Borrar todo el historial';

  @override
  String get delete_imported_db => 'Eliminar BD Importadas';

  @override
  String get delete_all_imported_confirm =>
      '¿Eliminar todas las ventas importadas?';

  @override
  String get cancel_button => 'Cancelar';

  @override
  String get delete_button => 'Eliminar';

  @override
  String get import_button => 'Importar';

  @override
  String get sales_imported => 'ventas importadas';

  @override
  String get imported_db_deleted => 'BD eliminadas';

  @override
  String get employee_name => 'Dependiente';

  @override
  String get total_sales => 'Ventas';

  @override
  String get total_sats_label => 'Total sats';

  @override
  String get employee_panel_title => 'Panel de Ventas';

  @override
  String get new_sale => 'NUEVA VENTA';

  @override
  String get new_sale_subtitle => 'Iniciar una nueva venta';

  @override
  String get pending_sales => 'VENTAS PENDIENTES';

  @override
  String get pending_sales_subtitle => 'Ver ventas pendientes';

  @override
  String get total_today => 'Total Hoy';

  @override
  String get sales_count => 'Ventas';

  @override
  String get sale_title => 'Nueva Venta';

  @override
  String get add_product => 'Agregar Producto';

  @override
  String get product_name => 'Producto';

  @override
  String get product_price => 'Precio';

  @override
  String get quantity => 'Cantidad';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get total => 'Total';

  @override
  String get clear_cart => 'Limpiar';

  @override
  String get process_sale => 'PROCESAR VENTA';

  @override
  String get sale_processing => 'PROCESANDO...';

  @override
  String get no_products => 'No hay productos';

  @override
  String get scan_product => 'Escanear Producto';

  @override
  String get manual_product => 'Agregar Manual';

  @override
  String get select_currency => 'Moneda';

  @override
  String get currency_usd => 'USD - Dólar';

  @override
  String get currency_eur => 'EUR - Euro';

  @override
  String get currency_cup => 'CUP - Peso Cubano';

  @override
  String get currency_mlc => 'MLC - Moneda Convertible';

  @override
  String get mlc_full_name => 'MLC - Moneda Convertible (CBDC)';

  @override
  String get currency_gbp => 'GBP - Libra Esterlina';

  @override
  String get currency_cad => 'CAD - Dólar Canadiense';

  @override
  String get currency_jpy => 'JPY - Yen Japonés';

  @override
  String get currency_aud => 'AUD - Dólar Australiano';

  @override
  String get currency_chf => 'CHF - Franco Suizo';

  @override
  String get currency_sat => 'SAT - Satoshis';

  @override
  String get cur_name_usd => 'Dólar';

  @override
  String get cur_name_eur => 'Euro';

  @override
  String get cur_name_cup => 'Peso Cubano';

  @override
  String get cur_name_mlc => 'Moneda Convertible';

  @override
  String get cur_name_gbp => 'Libra Esterlina';

  @override
  String get cur_name_cad => 'Dólar Canadiense';

  @override
  String get cur_name_jpy => 'Yen Japonés';

  @override
  String get cur_name_aud => 'Dólar Australiano';

  @override
  String get cur_name_chf => 'Franco Suizo';

  @override
  String get cur_name_sat => 'Satoshis';

  @override
  String get history_title => 'Historial de Ventas';

  @override
  String get filter_by_date => 'Filtrar por fecha';

  @override
  String get filter_by_employee => 'Filtrar por empleado';

  @override
  String get no_sales => 'No hay ventas';

  @override
  String get export_sales => 'Exportar';

  @override
  String get export_json => 'Exportar JSON';

  @override
  String get export_csv => 'Exportar CSV';

  @override
  String get sale_date => 'Fecha';

  @override
  String get sale_employee => 'Empleado';

  @override
  String get sale_total => 'Total';

  @override
  String get sale_items => 'Productos';

  @override
  String get settings_title => 'Configuración';

  @override
  String get language_settings => 'Idioma';

  @override
  String get currency_settings => 'Monedas';

  @override
  String get server_settings => 'Servidor';

  @override
  String get about_app => 'Acerca de';

  @override
  String get logout => 'Cerrar Sesión';

  @override
  String get about_title => 'Acerca de LaChispaPOS';

  @override
  String get about_version => 'Versión';

  @override
  String get about_description =>
      'Punto de Venta Lightning - Una aplicación para gestionar ventas utilizando Bitcoin a través de Lightning Network.';

  @override
  String get pending_sale_title => 'Venta Pendiente';

  @override
  String get pending_sale_message => 'Tienes una venta pendiente:';

  @override
  String get continue_sale => 'Continuar';

  @override
  String get discard_sale => 'Descartar';

  @override
  String get discard_table => 'Descartar mesa';

  @override
  String get error_generic => 'Error';

  @override
  String get success => 'Éxito';

  @override
  String get loading => 'Cargando...';

  @override
  String get retry => 'Reintentar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get yes => 'Sí';

  @override
  String get no => 'No';

  @override
  String get ok => 'Aceptar';

  @override
  String get save => 'Guardar';

  @override
  String get close => 'Cerrar';

  @override
  String get select_language => 'Seleccionar idioma';

  @override
  String get invoice_key_qr_title => 'QR de Clave de Facturación';

  @override
  String get no_invoice_key_configured => 'No hay Invoice Key configurada';

  @override
  String get select_currencies_hint => 'Selecciona las monedas que deseas usar';

  @override
  String get invoice_qr_title => 'QR Invoice';

  @override
  String get copy_button => 'Copiar';

  @override
  String get step_connect_1 => 'Abre LaChispa (la billetera del owner)';

  @override
  String get step_connect_2 => 'Menú lateral > QR de Clave de Facturación';

  @override
  String get step_connect_3 => 'Se mostrará el QR para escanear';

  @override
  String get step_connect_4 => 'Escanea el QR desde la app POS';

  @override
  String get steps_subtitle => 'El QR contiene la URL y la API Key juntos';

  @override
  String get features_title => 'FUNCIONES';

  @override
  String get roles_title => 'ROLES';

  @override
  String get how_to_connect => 'CÓMO CONECTAR';

  @override
  String get steps_title => 'Pasos para conectar:';

  @override
  String get developed_with => 'Desarrollado con';

  @override
  String get no_sales_to_export => 'No hay ventas para exportar';

  @override
  String get sales_deleted => 'Ventas eliminadas';

  @override
  String get employee => 'Dependiente';

  @override
  String get delete_sale_confirm => '¿Eliminar esta venta?';

  @override
  String get delete_sales_title => 'Eliminar Ventas';

  @override
  String get import_sales_title => 'Importar Ventas';

  @override
  String get invalid_price => 'Precio inválido';

  @override
  String get enter_product_and_price => 'Ingrese producto y precio';

  @override
  String get empty_cart => 'Carrito vacío';

  @override
  String get configure_api_in_settings => 'Configure API en Settings';

  @override
  String get error_creating_invoice => 'Error creando invoice';

  @override
  String get payment_received => '¡Pago recibido!';

  @override
  String get payment_error => 'Error en pago';

  @override
  String get waiting_for_payment => 'Esperando Pago';

  @override
  String get cobrar => 'COBRAR';

  @override
  String get copiado => 'Copiado';

  @override
  String get compartir => 'Compartir';

  @override
  String get pending_sale_confirm =>
      'Tiene una venta pendiente. ¿Desea retomarla?';

  @override
  String get retomar => 'Retomar';

  @override
  String get discard_confirm => '¿Eliminar todas las ventas importadas?';

  @override
  String get pay_with_nfc => 'Pagar con NFC';

  @override
  String get nfc_not_available => 'NFC no disponible';

  @override
  String get nfc_ready => 'Acerque el dispositivo al cliente';

  @override
  String get nfc_payment_cancelled => 'Pago NFC cancelado';

  @override
  String get nfc_error => 'Error NFC';

  @override
  String get tap_to_pay => 'Tocar para pagar';

  @override
  String get nfc_reading => 'Leyendo NFC...';

  @override
  String get lnurl_error => 'Error del servidor';

  @override
  String get drawer_stats => 'ESTADÍSTICAS';

  @override
  String get drawer_stats_subtitle => 'Ventas, gráficos y top productos';

  @override
  String get drawer_catalog => 'CATÁLOGO';

  @override
  String get drawer_catalog_subtitle => 'Gestionar productos';

  @override
  String get drawer_import_sales => 'IMPORTAR VENTAS';

  @override
  String get drawer_import_sales_subtitle => 'Importar ventas de dependientes';

  @override
  String get drawer_export_sales => 'EXPORTAR VENTAS';

  @override
  String get drawer_export_sales_subtitle => 'Exportar ventas a JSON';

  @override
  String get drawer_import_catalog => 'IMPORTAR CATÁLOGO';

  @override
  String get drawer_import_catalog_subtitle => 'Productos del jefe';

  @override
  String get drawer_delete_imported_subtitle => 'Eliminar ventas importadas';

  @override
  String get drawer_logout => 'Salir';

  @override
  String get catalog_title => 'Catálogo de Productos';

  @override
  String get catalog_new_product => 'Nuevo Producto';

  @override
  String get catalog_edit_product => 'Editar Producto';

  @override
  String get catalog_product_name_label => 'Nombre';

  @override
  String get catalog_product_name_hint => 'Nombre del producto';

  @override
  String get catalog_product_price_label => 'Precio';

  @override
  String get catalog_product_currency_label => 'Moneda';

  @override
  String get catalog_category_label => 'Categoría (opcional)';

  @override
  String get catalog_category_hint => 'Ej: Bebidas, Comidas';

  @override
  String get catalog_save => 'Guardar';

  @override
  String get catalog_add => 'Agregar';

  @override
  String get catalog_delete_title => 'Eliminar Producto';

  @override
  String catalog_delete_confirm(Object productName) {
    return '¿Eliminar \"$productName\"?';
  }

  @override
  String get catalog_export_tooltip => 'Exportar catálogo';

  @override
  String get catalog_no_products => 'No hay productos';

  @override
  String get catalog_add_first => 'Agregar primer producto';

  @override
  String get catalog_import_title => 'Importar Catálogo';

  @override
  String catalog_import_confirm(Object count) {
    return '¿Importar $count productos?';
  }

  @override
  String catalog_imported(Object count) {
    return '$count productos importados';
  }

  @override
  String get catalog_invalid_file => 'Archivo de catálogo inválido';

  @override
  String get receipt_title => 'Ticket';

  @override
  String get receipt_brand => 'LA CHISPA';

  @override
  String get receipt_subtitle => 'Punto de Venta Lightning';

  @override
  String get receipt_employee => 'Dependiente';

  @override
  String get receipt_date => 'Fecha';

  @override
  String get receipt_total => 'TOTAL';

  @override
  String get receipt_sats => 'sats';

  @override
  String get receipt_thanks => '¡Gracias por su compra!';

  @override
  String get receipt_website => 'lachispa.me';

  @override
  String get receipt_share => 'Compartir Ticket';

  @override
  String get receipt_new_sale => 'Nueva Venta';

  @override
  String get receipt_share_tooltip => 'Compartir';

  @override
  String get currency_mismatch_title => 'Monedas diferentes';

  @override
  String currency_mismatch_message(Object currency) {
    return 'No se pueden mezclar monedas en una misma venta. La venta actual está en $currency. Finalice o cancele la venta actual para cambiar de moneda.';
  }

  @override
  String get got_it => 'Entendido';

  @override
  String get confirm_table => 'Confirmar';

  @override
  String get manual_entry_tooltip => 'Entrada manual';

  @override
  String get catalog_mode_tooltip => 'Catálogo';

  @override
  String get search_products_hint => 'Buscar productos...';

  @override
  String no_results_in_currency(Object currency) {
    return 'Sin resultados en $currency';
  }

  @override
  String no_products_in_currency(Object currency) {
    return 'No hay productos en $currency';
  }

  @override
  String get try_other_currency => 'Prueba con otra moneda';

  @override
  String get product_label => 'Producto';

  @override
  String get name_hint => 'Nombre';

  @override
  String get price_label => 'Precio';

  @override
  String get add_products_hint => 'Agregue productos';

  @override
  String invoice_memo(Object userName) {
    return 'Venta POS - $userName';
  }

  @override
  String get settings_manual_entry => 'O ingrese manualmente:';

  @override
  String get settings_url_label => 'URL';

  @override
  String get settings_url_hint =>
      'https://lachispa.me o http://192.168.1.x:5000';

  @override
  String get settings_api_key_label => 'API Key';

  @override
  String get settings_ticket_section => 'Ticket';

  @override
  String get settings_ticket_description =>
      'Tras cada venta puedes compartir el ticket como texto. Más adelante añadiremos soporte para impresora térmica.';

  @override
  String get stats_title => 'Estadísticas';

  @override
  String get stats_last_7_days => 'Ventas últimos 7 días';

  @override
  String get stats_top_products => 'Top Productos';

  @override
  String get stats_by_employee => 'Por Empleado';

  @override
  String get stats_today => 'Hoy';

  @override
  String get stats_week => 'Semana';

  @override
  String get stats_month => 'Mes';

  @override
  String get stats_no_data => 'Sin datos';

  @override
  String get stats_sales_unit => 'ventas';

  @override
  String get stats_sats_unit => 'sats';

  @override
  String get total_label => 'TOTAL';

  @override
  String get btc_unit => 'BTC';

  @override
  String get history_ticket => 'Ticket';

  @override
  String get history_delete => 'Eliminar';

  @override
  String get print_subject => 'Ticket de venta LaChispaPOS';

  @override
  String get print_header => 'LA  CHISPA';

  @override
  String get print_subtitle => 'Punto de Venta Lightning';

  @override
  String get print_thanks => '  ¡Gracias por su compra!';

  @override
  String get print_url => '  lachispa.me';

  @override
  String get print_invoice => 'Factura:';

  @override
  String get export_subject => 'Exportación de ventas POS Lightning';

  @override
  String get export_invalid_json => 'Archivo JSON inválido';

  @override
  String get export_unknown => 'Desconocido';

  @override
  String get export_imported_name => 'Importado';

  @override
  String get export_catalog_subject => 'Catálogo de productos LaChispaPOS';

  @override
  String get table_label => 'Mesa';

  @override
  String get tables_title => 'Mesas';

  @override
  String get tables_active_title => 'Mesas activas';
}
