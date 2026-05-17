// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcome_title => 'La Chispa';

  @override
  String get welcome_subtitle => 'Lightning POS';

  @override
  String get get_started_button => 'GET STARTED';

  @override
  String get login_title => 'LaChispaPOS';

  @override
  String get login_subtitle => 'Lightning POS';

  @override
  String get username_label => 'Name';

  @override
  String get username_placeholder => 'Enter your name';

  @override
  String get username_required_error => 'Enter your name';

  @override
  String get select_role => 'Select Role';

  @override
  String get employee_role => 'Employee';

  @override
  String get boss_role => 'Boss';

  @override
  String get login_button => 'LOGIN';

  @override
  String get scan_qr_button => 'Scan API Key QR';

  @override
  String get verifying_api_key => 'Verifying API Key...';

  @override
  String get api_key_error => 'Error: Verify API Key';

  @override
  String get invalid_qr => 'Invalid QR';

  @override
  String get api_key_not_found => 'API Key not found';

  @override
  String get boss_panel_title => 'Boss Panel';

  @override
  String get import_sales => 'IMPORT DB';

  @override
  String get import_sales_subtitle => 'Import JSON file from employee';

  @override
  String get view_history => 'VIEW HISTORY';

  @override
  String get view_history_subtitle => 'All imported sales';

  @override
  String get delete_sales => 'DELETE SALES';

  @override
  String get delete_sales_subtitle => 'Delete all history';

  @override
  String get delete_imported_db => 'Delete Imported DB';

  @override
  String get delete_all_imported_confirm => 'Delete all imported sales?';

  @override
  String get cancel_button => 'Cancel';

  @override
  String get delete_button => 'Delete';

  @override
  String get import_button => 'Import';

  @override
  String get sales_imported => 'sales imported';

  @override
  String get imported_db_deleted => 'DB deleted';

  @override
  String get employee_name => 'Employee';

  @override
  String get total_sales => 'Sales';

  @override
  String get total_sats_label => 'Total sats';

  @override
  String get employee_panel_title => 'Sales Panel';

  @override
  String get new_sale => 'NEW SALE';

  @override
  String get new_sale_subtitle => 'Start a new sale';

  @override
  String get pending_sales => 'PENDING SALES';

  @override
  String get pending_sales_subtitle => 'View pending sales';

  @override
  String get total_today => 'Total Today';

  @override
  String get sales_count => 'Sales';

  @override
  String get sale_title => 'New Sale';

  @override
  String get add_product => 'Add Product';

  @override
  String get product_name => 'Product';

  @override
  String get product_price => 'Price';

  @override
  String get quantity => 'Quantity';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get total => 'Total';

  @override
  String get clear_cart => 'Clear';

  @override
  String get process_sale => 'PROCESS SALE';

  @override
  String get sale_processing => 'PROCESSING...';

  @override
  String get no_products => 'No products';

  @override
  String get scan_product => 'Scan Product';

  @override
  String get manual_product => 'Add Manual';

  @override
  String get select_currency => 'Currency';

  @override
  String get currency_usd => 'USD - Dollar';

  @override
  String get currency_eur => 'EUR - Euro';

  @override
  String get currency_cup => 'CUP - Cuban Peso';

  @override
  String get currency_mlc => 'MLC - Convertible Currency';

  @override
  String get mlc_full_name => 'MLC - Convertible Currency (CBDC)';

  @override
  String get currency_gbp => 'GBP - British Pound';

  @override
  String get currency_cad => 'CAD - Canadian Dollar';

  @override
  String get currency_jpy => 'JPY - Japanese Yen';

  @override
  String get currency_aud => 'AUD - Australian Dollar';

  @override
  String get currency_chf => 'CHF - Swiss Franc';

  @override
  String get currency_sat => 'SAT - Satoshis';

  @override
  String get cur_name_usd => 'Dollar';

  @override
  String get cur_name_eur => 'Euro';

  @override
  String get cur_name_cup => 'Cuban Peso';

  @override
  String get cur_name_mlc => 'Convertible Currency';

  @override
  String get cur_name_gbp => 'British Pound';

  @override
  String get cur_name_cad => 'Canadian Dollar';

  @override
  String get cur_name_jpy => 'Japanese Yen';

  @override
  String get cur_name_aud => 'Australian Dollar';

  @override
  String get cur_name_chf => 'Swiss Franc';

  @override
  String get cur_name_sat => 'Satoshis';

  @override
  String get history_title => 'Sales History';

  @override
  String get filter_by_date => 'Filter by date';

  @override
  String get filter_by_employee => 'Filter by employee';

  @override
  String get no_sales => 'No sales';

  @override
  String get export_sales => 'Export';

  @override
  String get export_json => 'Export JSON';

  @override
  String get export_csv => 'Export CSV';

  @override
  String get sale_date => 'Date';

  @override
  String get sale_employee => 'Employee';

  @override
  String get sale_total => 'Total';

  @override
  String get sale_items => 'Products';

  @override
  String get settings_title => 'Settings';

  @override
  String get language_settings => 'Language';

  @override
  String get currency_settings => 'Currency';

  @override
  String get server_settings => 'Server';

  @override
  String get about_app => 'About';

  @override
  String get logout => 'Logout';

  @override
  String get about_title => 'About LaChispaPOS';

  @override
  String get about_version => 'Version';

  @override
  String get about_description =>
      'Lightning POS - An application to manage sales using Bitcoin through Lightning Network.';

  @override
  String get pending_sale_title => 'Pending Sale';

  @override
  String get pending_sale_message => 'You have a pending sale:';

  @override
  String get continue_sale => 'Continue';

  @override
  String get discard_sale => 'Discard';

  @override
  String get discard_table => 'Discard table';

  @override
  String get error_generic => 'Error';

  @override
  String get success => 'Success';

  @override
  String get loading => 'Loading...';

  @override
  String get retry => 'Retry';

  @override
  String get confirm => 'Confirm';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get ok => 'OK';

  @override
  String get save => 'Save';

  @override
  String get close => 'Close';

  @override
  String get select_language => 'Select language';

  @override
  String get invoice_key_qr_title => 'Invoice Key QR';

  @override
  String get no_invoice_key_configured => 'No Invoice Key configured';

  @override
  String get select_currencies_hint => 'Select the currencies you want to use';

  @override
  String get invoice_qr_title => 'Invoice QR';

  @override
  String get copy_button => 'Copy';

  @override
  String get step_connect_1 => 'Open LaChispa (owner\'s wallet)';

  @override
  String get step_connect_2 => 'Side menu > Invoice Key QR';

  @override
  String get step_connect_3 => 'QR will be displayed to scan';

  @override
  String get step_connect_4 => 'Scan the QR from POS app';

  @override
  String get steps_subtitle => 'The QR contains the URL and API Key together';

  @override
  String get features_title => 'FEATURES';

  @override
  String get roles_title => 'ROLES';

  @override
  String get how_to_connect => 'HOW TO CONNECT';

  @override
  String get steps_title => 'Steps to connect:';

  @override
  String get developed_with => 'Developed with';

  @override
  String get no_sales_to_export => 'No sales to export';

  @override
  String get sales_deleted => 'Sales deleted';

  @override
  String get employee => 'Employee';

  @override
  String get delete_sale_confirm => 'Delete this sale?';

  @override
  String get delete_sales_title => 'Delete Sales';

  @override
  String get import_sales_title => 'Import Sales';

  @override
  String get invalid_price => 'Invalid price';

  @override
  String get enter_product_and_price => 'Enter product and price';

  @override
  String get empty_cart => 'Empty cart';

  @override
  String get configure_api_in_settings => 'Configure API in Settings';

  @override
  String get error_creating_invoice => 'Error creating invoice';

  @override
  String get payment_received => 'Payment received!';

  @override
  String get payment_error => 'Payment error';

  @override
  String get waiting_for_payment => 'Waiting for Payment';

  @override
  String get cobrar => 'CHARGE';

  @override
  String get copiado => 'Copied';

  @override
  String get compartir => 'Share';

  @override
  String get pending_sale_confirm =>
      'You have a pending sale. Do you want to resume it?';

  @override
  String get retomar => 'Resume';

  @override
  String get discard_confirm => 'Delete all imported sales?';

  @override
  String get pay_with_nfc => 'Pay with NFC';

  @override
  String get nfc_not_available => 'NFC not available';

  @override
  String get nfc_ready => 'Bring device close to customer';

  @override
  String get nfc_payment_cancelled => 'NFC payment cancelled';

  @override
  String get nfc_error => 'NFC error';

  @override
  String get tap_to_pay => 'Tap to pay';

  @override
  String get nfc_reading => 'Reading NFC...';

  @override
  String get lnurl_error => 'Server error';

  @override
  String get connection_error =>
      'Could not connect to the server. Check your internet connection.';

  @override
  String get server_error => 'Server error. Please try again later.';

  @override
  String get drawer_stats => 'STATISTICS';

  @override
  String get drawer_stats_subtitle => 'Sales, charts and top products';

  @override
  String get drawer_catalog => 'CATALOG';

  @override
  String get drawer_catalog_subtitle => 'Manage products';

  @override
  String get drawer_import_sales => 'IMPORT SALES';

  @override
  String get drawer_import_sales_subtitle => 'Import sales from employees';

  @override
  String get drawer_export_sales => 'EXPORT SALES';

  @override
  String get drawer_export_sales_subtitle => 'Export sales to JSON';

  @override
  String get drawer_import_catalog => 'IMPORT CATALOG';

  @override
  String get drawer_import_catalog_subtitle => 'Boss\'s products';

  @override
  String get drawer_delete_imported_subtitle => 'Delete imported sales';

  @override
  String get drawer_logout => 'Logout';

  @override
  String get catalog_title => 'Product Catalog';

  @override
  String get catalog_new_product => 'New Product';

  @override
  String get catalog_edit_product => 'Edit Product';

  @override
  String get catalog_product_name_label => 'Name';

  @override
  String get catalog_product_name_hint => 'Product name';

  @override
  String get catalog_product_price_label => 'Price';

  @override
  String get catalog_product_currency_label => 'Currency';

  @override
  String get catalog_category_label => 'Category (optional)';

  @override
  String get catalog_category_hint => 'E.g.: Drinks, Food';

  @override
  String get catalog_save => 'Save';

  @override
  String get catalog_add => 'Add';

  @override
  String get catalog_delete_title => 'Delete Product';

  @override
  String catalog_delete_confirm(Object productName) {
    return 'Delete \"$productName\"?';
  }

  @override
  String get catalog_export_tooltip => 'Export catalog';

  @override
  String get catalog_no_products => 'No products';

  @override
  String get catalog_add_first => 'Add first product';

  @override
  String get catalog_import_title => 'Import Catalog';

  @override
  String catalog_import_confirm(Object count) {
    return 'Import $count products?';
  }

  @override
  String catalog_imported(Object count) {
    return '$count products imported';
  }

  @override
  String get catalog_invalid_file => 'Invalid catalog file';

  @override
  String get catalog_name_price_required => 'Name and price are required';

  @override
  String get catalog_valid_price_required => 'Enter a valid positive price';

  @override
  String get receipt_title => 'Ticket';

  @override
  String get receipt_brand => 'LA CHISPA';

  @override
  String get receipt_subtitle => 'Lightning POS';

  @override
  String get receipt_employee => 'Employee';

  @override
  String get receipt_date => 'Date';

  @override
  String get receipt_total => 'TOTAL';

  @override
  String get receipt_sats => 'sats';

  @override
  String get receipt_thanks => 'Thank you for your purchase!';

  @override
  String get receipt_website => 'lachispa.me';

  @override
  String get receipt_share => 'Share Ticket';

  @override
  String get receipt_new_sale => 'New Sale';

  @override
  String get receipt_share_tooltip => 'Share';

  @override
  String get currency_mismatch_title => 'Different currencies';

  @override
  String currency_mismatch_message(Object currency) {
    return 'Cannot mix currencies in the same sale. Current sale is in $currency. Finish or cancel the current sale to change currency.';
  }

  @override
  String get got_it => 'Got it';

  @override
  String get confirm_table => 'Confirm';

  @override
  String get manual_entry_tooltip => 'Manual entry';

  @override
  String get catalog_mode_tooltip => 'Catalog';

  @override
  String get search_products_hint => 'Search products...';

  @override
  String no_results_in_currency(Object currency) {
    return 'No results in $currency';
  }

  @override
  String no_products_in_currency(Object currency) {
    return 'No products in $currency';
  }

  @override
  String get try_other_currency => 'Try another currency';

  @override
  String get product_label => 'Product';

  @override
  String get name_hint => 'Name';

  @override
  String get price_label => 'Price';

  @override
  String get add_products_hint => 'Add products';

  @override
  String invoice_memo(Object userName) {
    return 'POS Sale - $userName';
  }

  @override
  String get settings_manual_entry => 'Or enter manually:';

  @override
  String get settings_url_label => 'URL';

  @override
  String get settings_url_hint =>
      'https://lachispa.me or http://192.168.1.x:5000';

  @override
  String get settings_api_key_label => 'API Key';

  @override
  String get settings_ticket_section => 'Ticket';

  @override
  String get settings_ticket_description =>
      'After each sale you can share the ticket as text. Thermal printer support will be added later.';

  @override
  String get stats_title => 'Statistics';

  @override
  String get stats_last_7_days => 'Sales last 7 days';

  @override
  String get stats_top_products => 'Top Products';

  @override
  String get stats_by_employee => 'By Employee';

  @override
  String get stats_today => 'Today';

  @override
  String get stats_week => 'Week';

  @override
  String get stats_month => 'Month';

  @override
  String get stats_no_data => 'No data';

  @override
  String get stats_sales_unit => 'sales';

  @override
  String get stats_sats_unit => 'sats';

  @override
  String get total_label => 'TOTAL';

  @override
  String get btc_unit => 'BTC';

  @override
  String get history_ticket => 'Ticket';

  @override
  String get history_delete => 'Delete';

  @override
  String get print_subject => 'LaChispaPOS Sale Ticket';

  @override
  String get print_header => 'LA  CHISPA';

  @override
  String get print_subtitle => 'Lightning POS';

  @override
  String get print_thanks => '  Thank you for your purchase!';

  @override
  String get print_url => '  lachispa.me';

  @override
  String get print_invoice => 'Invoice:';

  @override
  String get export_subject => 'POS Lightning sales export';

  @override
  String get export_invalid_json => 'Invalid JSON file';

  @override
  String get export_unknown => 'Unknown';

  @override
  String get export_imported_name => 'Imported';

  @override
  String get export_catalog_subject => 'LaChispaPOS Product Catalog';

  @override
  String get table_label => 'Table';

  @override
  String get tables_title => 'Tables';

  @override
  String get tables_active_title => 'Active Tables';

  @override
  String get about_sale_desc =>
      'Start and process sales with Lightning Network';

  @override
  String get about_multicurrency_desc =>
      'Supports 10 currencies with real-time rates';

  @override
  String get about_exchange_rates => 'Exchange Rates';

  @override
  String get about_exchange_desc => 'Real-time quotes via Yadio.io';

  @override
  String get about_export_desc => 'Export sales to JSON for backup';

  @override
  String get about_import_desc => 'Import sales from employees';

  @override
  String get about_catalog_desc => 'Products with names, prices and categories';

  @override
  String get about_nfc_desc => 'Tap to pay using LNURL';

  @override
  String get about_tables_desc => 'Organize sales by tables';

  @override
  String get about_stats_desc => 'Charts, trends and top products';

  @override
  String get about_receipt_desc => 'Share receipt after each sale';

  @override
  String get about_multilang_desc => 'Available in 8 languages';
}
