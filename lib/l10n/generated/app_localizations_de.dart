// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get welcome_title => 'La Chispa';

  @override
  String get welcome_subtitle => 'Lightning POS';

  @override
  String get get_started_button => 'STARTEN';

  @override
  String get login_title => 'LaChispaPOS';

  @override
  String get login_subtitle => 'Lightning POS';

  @override
  String get username_label => 'Name';

  @override
  String get username_placeholder => 'Geben Sie Ihren Namen ein';

  @override
  String get username_required_error => 'Geben Sie Ihren Namen ein';

  @override
  String get select_role => 'Rolle auswählen';

  @override
  String get employee_role => 'Mitarbeiter';

  @override
  String get boss_role => 'Chef';

  @override
  String get login_button => 'ANMELDEN';

  @override
  String get scan_qr_button => 'API-Schlüssel QR scannen';

  @override
  String get verifying_api_key => 'API-Schlüssel wird überprüft...';

  @override
  String get api_key_error => 'Fehler: API-Schlüssel überprüfen';

  @override
  String get invalid_qr => 'Ungültiger QR';

  @override
  String get api_key_not_found => 'API-Schlüssel nicht gefunden';

  @override
  String get boss_panel_title => 'Chef-Panel';

  @override
  String get import_sales => 'DATENBANK IMPORTIEREN';

  @override
  String get import_sales_subtitle => 'JSON-Datei vom Mitarbeiter importieren';

  @override
  String get view_history => 'VERLAUF ANZEIGEN';

  @override
  String get view_history_subtitle => 'Alle importierten Verkäufe';

  @override
  String get delete_sales => 'VERKÄUFE LÖSCHEN';

  @override
  String get delete_sales_subtitle => 'Gesamten Verlauf löschen';

  @override
  String get delete_imported_db => 'Importierte DB löschen';

  @override
  String get delete_all_imported_confirm =>
      'Alle importierten Verkäufe löschen?';

  @override
  String get cancel_button => 'Abbrechen';

  @override
  String get delete_button => 'Löschen';

  @override
  String get import_button => 'Importieren';

  @override
  String get sales_imported => 'Verkäufe importiert';

  @override
  String get imported_db_deleted => 'DB gelöscht';

  @override
  String get employee_name => 'Mitarbeiter';

  @override
  String get total_sales => 'Verkäufe';

  @override
  String get total_sats_label => 'Gesamt sats';

  @override
  String get employee_panel_title => 'Verkaufspanel';

  @override
  String get new_sale => 'NEUER VERKAUF';

  @override
  String get new_sale_subtitle => 'Neuen Verkauf starten';

  @override
  String get pending_sales => 'AUSSTEHENDE VERKÄUFE';

  @override
  String get pending_sales_subtitle => 'Ausstehende Verkäufe anzeigen';

  @override
  String get total_today => 'Heute Gesamt';

  @override
  String get sales_count => 'Verkäufe';

  @override
  String get sale_title => 'Neuer Verkauf';

  @override
  String get add_product => 'Produkt hinzufügen';

  @override
  String get product_name => 'Produkt';

  @override
  String get product_price => 'Preis';

  @override
  String get quantity => 'Menge';

  @override
  String get subtotal => 'Zwischensumme';

  @override
  String get total => 'Gesamt';

  @override
  String get clear_cart => 'Leeren';

  @override
  String get process_sale => 'VERKAUF VERARBEITEN';

  @override
  String get sale_processing => 'WIRD VERARBEITET...';

  @override
  String get no_products => 'Keine Produkte';

  @override
  String get scan_product => 'Produkt scannen';

  @override
  String get manual_product => 'Manuell hinzufügen';

  @override
  String get select_currency => 'Währung';

  @override
  String get currency_usd => 'USD - Dollar';

  @override
  String get currency_eur => 'EUR - Euro';

  @override
  String get currency_cup => 'CUP - Kubanischer Peso';

  @override
  String get currency_mlc => 'MLC - Konvertierbare Währung';

  @override
  String get mlc_full_name => 'MLC - Konvertierbare Währung (CBDC)';

  @override
  String get currency_gbp => 'GBP - Britisches Pfund';

  @override
  String get currency_cad => 'CAD - Kanadischer Dollar';

  @override
  String get currency_jpy => 'JPY - Japanischer Yen';

  @override
  String get currency_aud => 'AUD - Australischer Dollar';

  @override
  String get currency_chf => 'CHF - Schweizer Franken';

  @override
  String get currency_sat => 'SAT - Satoshis';

  @override
  String get history_title => 'Verkaufsverlauf';

  @override
  String get filter_by_date => 'Nach Datum filtern';

  @override
  String get filter_by_employee => 'Nach Mitarbeiter filtern';

  @override
  String get no_sales => 'Keine Verkäufe';

  @override
  String get export_sales => 'Exportieren';

  @override
  String get export_json => 'JSON exportieren';

  @override
  String get export_csv => 'CSV exportieren';

  @override
  String get sale_date => 'Datum';

  @override
  String get sale_employee => 'Mitarbeiter';

  @override
  String get sale_total => 'Gesamt';

  @override
  String get sale_items => 'Produkte';

  @override
  String get settings_title => 'Einstellungen';

  @override
  String get language_settings => 'Sprache';

  @override
  String get currency_settings => 'Währungen';

  @override
  String get server_settings => 'Server';

  @override
  String get about_app => 'Über';

  @override
  String get logout => 'Abmelden';

  @override
  String get about_title => 'Über LaChispaPOS';

  @override
  String get about_version => 'Version';

  @override
  String get about_description =>
      'Lightning POS - Eine Anwendung zur Verwaltung von Verkäufen mit Bitcoin über das Lightning Network.';

  @override
  String get pending_sale_title => 'Ausstehender Verkauf';

  @override
  String get pending_sale_message => 'Sie haben einen ausstehenden Verkauf:';

  @override
  String get continue_sale => 'Fortsetzen';

  @override
  String get discard_sale => 'Verwerfen';

  @override
  String get error_generic => 'Fehler';

  @override
  String get success => 'Erfolg';

  @override
  String get loading => 'Wird geladen...';

  @override
  String get retry => 'Erneut versuchen';

  @override
  String get confirm => 'Bestätigen';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nein';

  @override
  String get ok => 'OK';

  @override
  String get save => 'Speichern';

  @override
  String get close => 'Schließen';

  @override
  String get select_language => 'Sprache auswählen';

  @override
  String get invoice_key_qr_title => 'Rechnungsschlüssel QR';

  @override
  String get no_invoice_key_configured =>
      'Kein Rechnungsschlüssel konfiguriert';

  @override
  String get select_currencies_hint => 'Wählen Sie die gewünschten Währungen';

  @override
  String get invoice_qr_title => 'Rechnungs QR';

  @override
  String get copy_button => 'Kopieren';

  @override
  String get step_connect_1 =>
      'Öffnen Sie LaChispa (Brieftasche des Eigentümers)';

  @override
  String get step_connect_2 => 'Seitenmenü > Rechnungsschlüssel QR';

  @override
  String get step_connect_3 => 'QR wird zum Scannen angezeigt';

  @override
  String get step_connect_4 => 'Scannen Sie den QR von der POS-App';

  @override
  String get steps_subtitle =>
      'Der QR enthält die URL und den API-Schlüssel zusammen';

  @override
  String get features_title => 'FUNKTIONEN';

  @override
  String get roles_title => 'ROLLEN';

  @override
  String get how_to_connect => 'WIE MAN VERBINDET';

  @override
  String get steps_title => 'Schritte zum Verbinden:';

  @override
  String get developed_with => 'Entwickelt mit';

  @override
  String get no_sales_to_export => 'Keine Verkäufe zum Exportieren';

  @override
  String get sales_deleted => 'Verkäufe gelöscht';

  @override
  String get employee => 'Mitarbeiter';

  @override
  String get delete_sale_confirm => 'Diesen Verkauf löschen?';

  @override
  String get delete_sales_title => 'Verkäufe löschen';

  @override
  String get import_sales_title => 'Verkäufe importieren';

  @override
  String get invalid_price => 'Ungültiger Preis';

  @override
  String get enter_product_and_price => 'Produkt und Preis eingeben';

  @override
  String get empty_cart => 'Warenkorb leer';

  @override
  String get configure_api_in_settings => 'API in Einstellungen konfigurieren';

  @override
  String get error_creating_invoice => 'Fehler beim Erstellen der Rechnung';

  @override
  String get payment_received => 'Zahlung erhalten!';

  @override
  String get payment_error => 'Zahlungsfehler';

  @override
  String get waiting_for_payment => 'Warten auf Zahlung';

  @override
  String get cobrar => 'ABRECHNEN';

  @override
  String get copiado => 'Kopiert';

  @override
  String get compartir => 'Teilen';

  @override
  String get pending_sale_confirm =>
      'Sie haben einen ausstehenden Verkauf. Möchten Sie ihn fortsetzen?';

  @override
  String get retomar => 'Fortsetzen';

  @override
  String get discard_confirm => 'Alle importierten Verkäufe löschen?';

  @override
  String get pay_with_nfc => 'Mit NFC bezahlen';

  @override
  String get nfc_not_available => 'NFC nicht verfügbar';

  @override
  String get nfc_ready => 'Gerät an Kunden halten';

  @override
  String get nfc_payment_cancelled => 'NFC-Zahlung abgebrochen';

  @override
  String get nfc_error => 'NFC-Fehler';

  @override
  String get tap_to_pay => 'Zum Bezahlen tippen';

  @override
  String get nfc_reading => 'NFC wird gelesen...';

  @override
  String get lnurl_error => 'Serverfehler';

  @override
  String get drawer_stats => 'STATISTIK';

  @override
  String get drawer_stats_subtitle => 'Verkäufe, Diagramme und Top-Produkte';

  @override
  String get drawer_catalog => 'KATALOG';

  @override
  String get drawer_catalog_subtitle => 'Produkte verwalten';

  @override
  String get drawer_import_sales => 'VERKÄUFE IMPORTIEREN';

  @override
  String get drawer_import_sales_subtitle =>
      'Verkäufe von Mitarbeitern importieren';

  @override
  String get drawer_export_sales => 'VERKÄUFE EXPORTIEREN';

  @override
  String get drawer_export_sales_subtitle => 'Verkäufe als JSON exportieren';

  @override
  String get drawer_import_catalog => 'KATALOG IMPORTIEREN';

  @override
  String get drawer_import_catalog_subtitle => 'Produkte des Chefs';

  @override
  String get drawer_delete_imported_subtitle => 'Importierte Verkäufe löschen';

  @override
  String get drawer_logout => 'Abmelden';

  @override
  String get catalog_title => 'Produktkatalog';

  @override
  String get catalog_new_product => 'Neues Produkt';

  @override
  String get catalog_edit_product => 'Produkt bearbeiten';

  @override
  String get catalog_product_name_label => 'Name';

  @override
  String get catalog_product_name_hint => 'Produktname';

  @override
  String get catalog_product_price_label => 'Preis';

  @override
  String get catalog_product_currency_label => 'Währung';

  @override
  String get catalog_category_label => 'Kategorie (optional)';

  @override
  String get catalog_category_hint => 'Z.B.: Getränke, Essen';

  @override
  String get catalog_save => 'Speichern';

  @override
  String get catalog_add => 'Hinzufügen';

  @override
  String get catalog_delete_title => 'Produkt löschen';

  @override
  String catalog_delete_confirm(Object productName) {
    return '\"$productName\" löschen?';
  }

  @override
  String get catalog_export_tooltip => 'Katalog exportieren';

  @override
  String get catalog_no_products => 'Keine Produkte';

  @override
  String get catalog_add_first => 'Erstes Produkt hinzufügen';

  @override
  String get catalog_import_title => 'Katalog importieren';

  @override
  String catalog_import_confirm(Object count) {
    return '$count Produkte importieren?';
  }

  @override
  String catalog_imported(Object count) {
    return '$count Produkte importiert';
  }

  @override
  String get catalog_invalid_file => 'Ungültige Katalogdatei';

  @override
  String get receipt_title => 'Quittung';

  @override
  String get receipt_brand => 'LA CHISPA';

  @override
  String get receipt_subtitle => 'Lightning POS';

  @override
  String get receipt_employee => 'Mitarbeiter';

  @override
  String get receipt_date => 'Datum';

  @override
  String get receipt_total => 'GESAMT';

  @override
  String get receipt_sats => 'sats';

  @override
  String get receipt_thanks => 'Vielen Dank für Ihren Einkauf!';

  @override
  String get receipt_website => 'lachispa.me';

  @override
  String get receipt_share => 'Quittung teilen';

  @override
  String get receipt_new_sale => 'Neuer Verkauf';

  @override
  String get receipt_share_tooltip => 'Teilen';

  @override
  String get currency_mismatch_title => 'Verschiedene Währungen';

  @override
  String currency_mismatch_message(Object currency) {
    return 'Währungen können nicht in einem Verkauf gemischt werden. Der aktuelle Verkauf ist in $currency. Beenden oder abbrechen Sie den Verkauf, um die Währung zu wechseln.';
  }

  @override
  String get got_it => 'Verstanden';

  @override
  String get manual_entry_tooltip => 'Manuelle Eingabe';

  @override
  String get catalog_mode_tooltip => 'Katalog';

  @override
  String get search_products_hint => 'Produkte suchen...';

  @override
  String no_results_in_currency(Object currency) {
    return 'Keine Ergebnisse in $currency';
  }

  @override
  String no_products_in_currency(Object currency) {
    return 'Keine Produkte in $currency';
  }

  @override
  String get try_other_currency => 'Versuchen Sie eine andere Währung';

  @override
  String get product_label => 'Produkt';

  @override
  String get name_hint => 'Name';

  @override
  String get price_label => 'Preis';

  @override
  String get add_products_hint => 'Produkte hinzufügen';

  @override
  String invoice_memo(Object userName) {
    return 'POS Verkauf - $userName';
  }

  @override
  String get settings_manual_entry => 'Oder manuell eingeben:';

  @override
  String get settings_url_label => 'URL';

  @override
  String get settings_url_hint =>
      'https://lachispa.me oder http://192.168.1.x:5000';

  @override
  String get settings_api_key_label => 'API-Schlüssel';

  @override
  String get settings_ticket_section => 'Quittung';

  @override
  String get settings_ticket_description =>
      'Nach jedem Verkauf können Sie die Quittung als Text teilen. Thermoprinter-Unterstützung wird später hinzugefügt.';

  @override
  String get stats_title => 'Statistiken';

  @override
  String get stats_last_7_days => 'Verkäufe der letzten 7 Tage';

  @override
  String get stats_top_products => 'Top-Produkte';

  @override
  String get stats_by_employee => 'Nach Mitarbeiter';

  @override
  String get stats_today => 'Heute';

  @override
  String get stats_week => 'Woche';

  @override
  String get stats_month => 'Monat';

  @override
  String get stats_no_data => 'Keine Daten';

  @override
  String get stats_sales_unit => 'Verkäufe';

  @override
  String get stats_sats_unit => 'sats';

  @override
  String get total_label => 'GESAMT';

  @override
  String get btc_unit => 'BTC';

  @override
  String get history_ticket => 'Quittung';

  @override
  String get history_delete => 'Löschen';

  @override
  String get print_subject => 'LaChispaPOS Verkaufsquittung';

  @override
  String get print_header => 'LA  CHISPA';

  @override
  String get print_subtitle => 'Lightning POS';

  @override
  String get print_thanks => '  Vielen Dank für Ihren Einkauf!';

  @override
  String get print_url => '  lachispa.me';

  @override
  String get print_invoice => 'Rechnung:';

  @override
  String get export_subject => 'POS Lightning Verkaufsexport';

  @override
  String get export_invalid_json => 'Ungültige JSON-Datei';

  @override
  String get export_unknown => 'Unbekannt';

  @override
  String get export_imported_name => 'Importiert';

  @override
  String get export_catalog_subject => 'LaChispaPOS Produktkatalog';

  @override
  String get table_label => 'Mesa';

  @override
  String get tables_title => 'Mesas';

  @override
  String get tables_active_title => 'Mesas activas';

  @override
  String get catalog_qr_export => 'Exportar QR';

  @override
  String catalog_qr_page(Object current, Object total) {
    return 'QR $current de $total';
  }

  @override
  String get catalog_qr_scan_button => 'Escanear QR';

  @override
  String catalog_qr_progress(Object current, Object total) {
    return 'Escaneado QR $current de $total';
  }

  @override
  String get catalog_qr_done => '¡Catálogo completo!';

  @override
  String get catalog_qr_scan_choice => 'Importar desde archivo o escanear QR';
}
