// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get welcome_title => 'La Chispa';

  @override
  String get welcome_subtitle => 'Lightning POS';

  @override
  String get get_started_button => 'INIZIA';

  @override
  String get login_title => 'LaChispaPOS';

  @override
  String get login_subtitle => 'Lightning POS';

  @override
  String get username_label => 'Nome';

  @override
  String get username_placeholder => 'Inserisci il tuo nome';

  @override
  String get username_required_error => 'Inserisci il tuo nome';

  @override
  String get select_role => 'Seleziona ruolo';

  @override
  String get employee_role => 'Dipendente';

  @override
  String get boss_role => 'Capo';

  @override
  String get login_button => 'ACCEDI';

  @override
  String get scan_qr_button => 'Scansiona QR chiave API';

  @override
  String get verifying_api_key => 'Verifica chiave API...';

  @override
  String get api_key_error => 'Errore: Verifica chiave API';

  @override
  String get invalid_qr => 'QR non valido';

  @override
  String get api_key_not_found => 'Chiave API non trovata';

  @override
  String get boss_panel_title => 'Pannello Capo';

  @override
  String get import_sales => 'IMPORTA DB';

  @override
  String get import_sales_subtitle => 'Importa file JSON dal dipendente';

  @override
  String get view_history => 'VISUALIZZA CRONOLOGIA';

  @override
  String get view_history_subtitle => 'Tutte le vendite importate';

  @override
  String get delete_sales => 'ELIMINA VENDITE';

  @override
  String get delete_sales_subtitle => 'Elimina tutta la cronologia';

  @override
  String get delete_imported_db => 'Elimina DB importato';

  @override
  String get delete_all_imported_confirm =>
      'Eliminare tutte le vendite importate?';

  @override
  String get cancel_button => 'Annulla';

  @override
  String get delete_button => 'Elimina';

  @override
  String get import_button => 'Importa';

  @override
  String get sales_imported => 'vendite importate';

  @override
  String get imported_db_deleted => 'DB eliminato';

  @override
  String get employee_name => 'Dipendente';

  @override
  String get total_sales => 'Vendite';

  @override
  String get total_sats_label => 'Totale sats';

  @override
  String get employee_panel_title => 'Pannello vendite';

  @override
  String get new_sale => 'NUOVA VENDITA';

  @override
  String get new_sale_subtitle => 'Avvia una nuova vendita';

  @override
  String get pending_sales => 'VENDITE IN ATTESA';

  @override
  String get pending_sales_subtitle => 'Visualizza vendite in attesa';

  @override
  String get total_today => 'Totale oggi';

  @override
  String get sales_count => 'Vendite';

  @override
  String get sale_title => 'Nuova vendita';

  @override
  String get add_product => 'Aggiungi prodotto';

  @override
  String get product_name => 'Prodotto';

  @override
  String get product_price => 'Prezzo';

  @override
  String get quantity => 'Quantità';

  @override
  String get subtotal => 'Subtotale';

  @override
  String get total => 'Totale';

  @override
  String get clear_cart => 'Svuota';

  @override
  String get process_sale => 'ELABORA VENDITA';

  @override
  String get sale_processing => 'ELABORAZIONE...';

  @override
  String get no_products => 'Nessun prodotto';

  @override
  String get scan_product => 'Scansiona prodotto';

  @override
  String get manual_product => 'Aggiungi manuale';

  @override
  String get select_currency => 'Valuta';

  @override
  String get currency_usd => 'USD - Dollaro';

  @override
  String get currency_eur => 'EUR - Euro';

  @override
  String get currency_cup => 'CUP - Peso cubano';

  @override
  String get currency_mlc => 'MLC - Valuta Convertibile';

  @override
  String get mlc_full_name => 'MLC - Valuta Convertibile (CBDC)';

  @override
  String get currency_gbp => 'GBP - Sterlina britannica';

  @override
  String get currency_cad => 'CAD - Dollaro canadese';

  @override
  String get currency_jpy => 'JPY - Yen giapponese';

  @override
  String get currency_aud => 'AUD - Dollaro australiano';

  @override
  String get currency_chf => 'CHF - Franco svizzero';

  @override
  String get currency_sat => 'SAT - Satoshis';

  @override
  String get cur_name_usd => 'Dollaro';

  @override
  String get cur_name_eur => 'Euro';

  @override
  String get cur_name_cup => 'Peso cubano';

  @override
  String get cur_name_mlc => 'Valuta Convertibile';

  @override
  String get cur_name_gbp => 'Sterlina britannica';

  @override
  String get cur_name_cad => 'Dollaro canadese';

  @override
  String get cur_name_jpy => 'Yen giapponese';

  @override
  String get cur_name_aud => 'Dollaro australiano';

  @override
  String get cur_name_chf => 'Franco svizzero';

  @override
  String get cur_name_sat => 'Satoshis';

  @override
  String get history_title => 'Cronologia vendite';

  @override
  String get filter_by_date => 'Filtra per data';

  @override
  String get filter_by_employee => 'Filtra per dipendente';

  @override
  String get no_sales => 'Nessuna vendita';

  @override
  String get export_sales => 'Esporta';

  @override
  String get export_json => 'Esporta JSON';

  @override
  String get export_csv => 'Esporta CSV';

  @override
  String get sale_date => 'Data';

  @override
  String get sale_employee => 'Dipendente';

  @override
  String get sale_total => 'Totale';

  @override
  String get sale_items => 'Prodotti';

  @override
  String get settings_title => 'Impostazioni';

  @override
  String get language_settings => 'Lingua';

  @override
  String get currency_settings => 'Valute';

  @override
  String get server_settings => 'Server';

  @override
  String get about_app => 'Informazioni';

  @override
  String get logout => 'Disconnetti';

  @override
  String get about_title => 'Informazioni su LaChispaPOS';

  @override
  String get about_version => 'Versione';

  @override
  String get about_description =>
      'Lightning POS - Un\'applicazione per gestire le vendite utilizzando Bitcoin tramite Lightning Network.';

  @override
  String get pending_sale_title => 'Vendita in attesa';

  @override
  String get pending_sale_message => 'Hai una vendita in attesa:';

  @override
  String get continue_sale => 'Continua';

  @override
  String get discard_sale => 'Scarta';

  @override
  String get discard_table => 'Scarta tavolo';

  @override
  String get error_generic => 'Errore';

  @override
  String get success => 'Successo';

  @override
  String get loading => 'Caricamento...';

  @override
  String get retry => 'Riprova';

  @override
  String get confirm => 'Conferma';

  @override
  String get yes => 'Sì';

  @override
  String get no => 'No';

  @override
  String get ok => 'OK';

  @override
  String get save => 'Salva';

  @override
  String get close => 'Chiudi';

  @override
  String get select_language => 'Seleziona lingua';

  @override
  String get invoice_key_qr_title => 'QR Chiave Fattura';

  @override
  String get no_invoice_key_configured => 'Nessuna chiave fattura configurata';

  @override
  String get select_currencies_hint => 'Seleziona le valute che desideri usare';

  @override
  String get invoice_qr_title => 'QR Fattura';

  @override
  String get copy_button => 'Copia';

  @override
  String get step_connect_1 => 'Apri LaChispa (wallet del proprietario)';

  @override
  String get step_connect_2 => 'Menu laterale > QR Chiave Fattura';

  @override
  String get step_connect_3 => 'Il QR verrà visualizzato per la scansione';

  @override
  String get step_connect_4 => 'Scansiona il QR dall\'app POS';

  @override
  String get steps_subtitle => 'Il QR contiene l\'URL e la chiave API insieme';

  @override
  String get features_title => 'FUNZIONI';

  @override
  String get roles_title => 'RUOLI';

  @override
  String get how_to_connect => 'COME COLLEGARE';

  @override
  String get steps_title => 'Passaggi per collegare:';

  @override
  String get developed_with => 'Sviluppato con';

  @override
  String get no_sales_to_export => 'Nessuna vendita da esportare';

  @override
  String get sales_deleted => 'Vendite eliminate';

  @override
  String get employee => 'Dipendente';

  @override
  String get delete_sale_confirm => 'Eliminare questa vendita?';

  @override
  String get delete_sales_title => 'Elimina Vendite';

  @override
  String get import_sales_title => 'Importa Vendite';

  @override
  String get invalid_price => 'Prezzo non valido';

  @override
  String get enter_product_and_price => 'Inserisci prodotto e prezzo';

  @override
  String get empty_cart => 'Carrello vuoto';

  @override
  String get configure_api_in_settings => 'Configura API in Impostazioni';

  @override
  String get error_creating_invoice => 'Errore creazione fattura';

  @override
  String get payment_received => 'Pagamento ricevuto!';

  @override
  String get payment_error => 'Errore pagamento';

  @override
  String get waiting_for_payment => 'In attesa di pagamento';

  @override
  String get cobrar => 'ADDEBITARE';

  @override
  String get copiado => 'Copiato';

  @override
  String get compartir => 'Condividere';

  @override
  String get pending_sale_confirm =>
      'Hai una vendita in attesa. Vuoi riprenderla?';

  @override
  String get retomar => 'Riprendere';

  @override
  String get discard_confirm => 'Eliminare tutte le vendite importate?';

  @override
  String get pay_with_nfc => 'Paga con NFC';

  @override
  String get nfc_not_available => 'NFC non disponibile';

  @override
  String get nfc_ready => 'Avvicina il dispositivo al cliente';

  @override
  String get nfc_payment_cancelled => 'Pagamento NFC annullato';

  @override
  String get nfc_error => 'Errore NFC';

  @override
  String get tap_to_pay => 'Tocca per pagare';

  @override
  String get nfc_reading => 'Lettura NFC...';

  @override
  String get lnurl_error => 'Errore del server';

  @override
  String get connection_error =>
      'Impossibile connettersi al server. Controlla la connessione Internet.';

  @override
  String get server_error => 'Errore del server. Riprova più tardi.';

  @override
  String get drawer_stats => 'STATISTICHE';

  @override
  String get drawer_stats_subtitle => 'Vendite, grafici e top prodotti';

  @override
  String get drawer_catalog => 'CATALOGO';

  @override
  String get drawer_catalog_subtitle => 'Gestisci prodotti';

  @override
  String get drawer_import_sales => 'IMPORTA VENDITE';

  @override
  String get drawer_import_sales_subtitle => 'Importa vendite dagli impiegati';

  @override
  String get drawer_export_sales => 'ESPORTA VENDITE';

  @override
  String get drawer_export_sales_subtitle => 'Esporta vendite in JSON';

  @override
  String get drawer_export_catalog => 'EXPORTAR CATÁLOGO';

  @override
  String get drawer_export_catalog_subtitle =>
      'Compartir productos con dependientes';

  @override
  String get drawer_import_catalog => 'IMPORTA CATALOGO';

  @override
  String get drawer_import_catalog_subtitle => 'Prodotti del capo';

  @override
  String get drawer_delete_imported_subtitle => 'Elimina vendite importate';

  @override
  String get drawer_logout => 'Esci';

  @override
  String get catalog_title => 'Catalogo Prodotti';

  @override
  String get catalog_new_product => 'Nuovo Prodotto';

  @override
  String get catalog_edit_product => 'Modifica Prodotto';

  @override
  String get catalog_product_name_label => 'Nome';

  @override
  String get catalog_product_name_hint => 'Nome del prodotto';

  @override
  String get catalog_product_price_label => 'Prezzo';

  @override
  String get catalog_product_currency_label => 'Valuta';

  @override
  String get catalog_category_label => 'Categoria (opzionale)';

  @override
  String get catalog_category_hint => 'Es: Bevande, Cibi';

  @override
  String get catalog_save => 'Salva';

  @override
  String get catalog_add => 'Aggiungi';

  @override
  String get catalog_delete_title => 'Elimina Prodotto';

  @override
  String catalog_delete_confirm(Object productName) {
    return 'Eliminare \"$productName\"?';
  }

  @override
  String get catalog_export_tooltip => 'Esporta catalogo';

  @override
  String get catalog_no_products => 'Nessun prodotto';

  @override
  String get catalog_add_first => 'Aggiungi primo prodotto';

  @override
  String get catalog_import_title => 'Importa Catalogo';

  @override
  String catalog_import_confirm(Object count) {
    return 'Importare $count prodotti?';
  }

  @override
  String catalog_imported(Object count) {
    return '$count prodotti importati';
  }

  @override
  String get catalog_invalid_file => 'File catalogo non valido';

  @override
  String get catalog_name_price_required => 'Nombre y precio son requeridos';

  @override
  String get catalog_valid_price_required =>
      'Ingrese un precio válido positivo';

  @override
  String get catalog_stock_label => 'Stock';

  @override
  String get catalog_stock_hint => 'Dejar vacío para ilimitado';

  @override
  String get catalog_stock_add => 'Agregar stock';

  @override
  String get catalog_stock_remove => 'Quitar stock';

  @override
  String get catalog_out_of_stock => 'AGOTADO';

  @override
  String get receipt_title => 'Scontrino';

  @override
  String get receipt_brand => 'LA CHISPA';

  @override
  String get receipt_subtitle => 'Lightning POS';

  @override
  String get receipt_employee => 'Impiegato';

  @override
  String get receipt_date => 'Data';

  @override
  String get receipt_total => 'TOTALE';

  @override
  String get receipt_sats => 'sats';

  @override
  String get receipt_thanks => 'Grazie per l\'acquisto!';

  @override
  String get receipt_website => 'lachispa.me';

  @override
  String get receipt_share => 'Condividi Scontrino';

  @override
  String get receipt_new_sale => 'Nuova Vendita';

  @override
  String get receipt_share_tooltip => 'Condividi';

  @override
  String get currency_mismatch_title => 'Valute diverse';

  @override
  String currency_mismatch_message(Object currency) {
    return 'Non puoi mescolare valute nella stessa vendita. La vendita attuale è in $currency. Termina o annulla la vendita per cambiare valuta.';
  }

  @override
  String get got_it => 'Ho capito';

  @override
  String get confirm_table => 'Conferma';

  @override
  String get manual_entry_tooltip => 'Inserimento manuale';

  @override
  String get catalog_mode_tooltip => 'Catalogo';

  @override
  String get search_products_hint => 'Cerca prodotti...';

  @override
  String no_results_in_currency(Object currency) {
    return 'Nessun risultato in $currency';
  }

  @override
  String no_products_in_currency(Object currency) {
    return 'Nessun prodotto in $currency';
  }

  @override
  String get try_other_currency => 'Prova un\'altra valuta';

  @override
  String get product_label => 'Prodotto';

  @override
  String get name_hint => 'Nome';

  @override
  String get price_label => 'Prezzo';

  @override
  String get add_products_hint => 'Aggiungi prodotti';

  @override
  String invoice_memo(Object userName) {
    return 'Vendita POS - $userName';
  }

  @override
  String get settings_manual_entry => 'O inserisci manualmente:';

  @override
  String get settings_url_label => 'URL';

  @override
  String get settings_url_hint =>
      'https://lachispa.me o http://192.168.1.x:5000';

  @override
  String get settings_api_key_label => 'Chiave API';

  @override
  String get settings_ticket_section => 'Scontrino';

  @override
  String get settings_ticket_description =>
      'Dopo ogni vendita puoi condividere lo scontrino come testo. Il supporto per stampante termica sarà aggiunto in seguito.';

  @override
  String get stats_title => 'Statistiche';

  @override
  String get stats_last_7_days => 'Vendite ultimi 7 giorni';

  @override
  String get stats_top_products => 'Top Prodotti';

  @override
  String get stats_by_employee => 'Per Impiegato';

  @override
  String get stats_today => 'Oggi';

  @override
  String get stats_week => 'Settimana';

  @override
  String get stats_month => 'Mese';

  @override
  String get stats_no_data => 'Nessun dato';

  @override
  String get stats_sales_unit => 'vendite';

  @override
  String get stats_sats_unit => 'sats';

  @override
  String get total_label => 'TOTALE';

  @override
  String get btc_unit => 'BTC';

  @override
  String get history_ticket => 'Scontrino';

  @override
  String get history_delete => 'Elimina';

  @override
  String get print_subject => 'Scontrino vendita LaChispaPOS';

  @override
  String get print_header => 'LA  CHISPA';

  @override
  String get print_subtitle => 'Lightning POS';

  @override
  String get print_thanks => '  Grazie per l\'acquisto!';

  @override
  String get print_url => '  lachispa.me';

  @override
  String get print_invoice => 'Fattura:';

  @override
  String get export_subject => 'Esportazione vendite POS Lightning';

  @override
  String get export_invalid_json => 'File JSON non valido';

  @override
  String get export_unknown => 'Sconosciuto';

  @override
  String get export_imported_name => 'Importato';

  @override
  String get export_catalog_subject => 'Catalogo prodotti LaChispaPOS';

  @override
  String get table_label => 'Mesa';

  @override
  String get tables_title => 'Mesas';

  @override
  String get tables_active_title => 'Mesas activas';

  @override
  String get about_sale_desc =>
      'Avvia e processa vendite con Lightning Network';

  @override
  String get about_multicurrency_desc =>
      'Supporta 10 valute con tassi in tempo reale';

  @override
  String get about_exchange_rates => 'Tassi di Cambio';

  @override
  String get about_exchange_desc => 'Quotazioni in tempo reale via Yadio.io';

  @override
  String get about_export_desc => 'Esporta vendite in JSON';

  @override
  String get about_import_desc => 'Importa vendite dai dipendenti';

  @override
  String get about_catalog_desc => 'Prodotti con nomi, prezzi e categorie';

  @override
  String get about_nfc_desc => 'Paga con NFC usando LNURL';

  @override
  String get about_tables_desc => 'Organizza vendite per tavoli';

  @override
  String get about_stats_desc => 'Grafici, tendenze e prodotti top';

  @override
  String get about_receipt_desc => 'Condividi ricevuta dopo ogni vendita';

  @override
  String get about_multilang_desc => 'Disponibile in 8 lingue';

  @override
  String get keep_table_open => 'Dejar mesa abierta';

  @override
  String get saved => 'Guardado';

  @override
  String get view_orders => 'Ver pedidos';

  @override
  String get no_sales_history => 'No hay ventas en el historial';

  @override
  String get sales => 'ventas';

  @override
  String get pending_orders => 'Pedidos pendientes';

  @override
  String get paid_orders => 'Pedidos pagados';
}
