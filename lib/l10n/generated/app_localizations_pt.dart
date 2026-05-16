// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get welcome_title => 'La Chispa';

  @override
  String get welcome_subtitle => 'Lightning POS';

  @override
  String get get_started_button => 'COMEÇAR';

  @override
  String get login_title => 'LaChispaPOS';

  @override
  String get login_subtitle => 'Lightning POS';

  @override
  String get username_label => 'Nome';

  @override
  String get username_placeholder => 'Digite seu nome';

  @override
  String get username_required_error => 'Digite seu nome';

  @override
  String get select_role => 'Selecionar Função';

  @override
  String get employee_role => 'Funcionário';

  @override
  String get boss_role => 'Chefe';

  @override
  String get login_button => 'ENTRAR';

  @override
  String get scan_qr_button => 'Escanear QR API Key';

  @override
  String get verifying_api_key => 'Verificando API Key...';

  @override
  String get api_key_error => 'Erro: Verifique API Key';

  @override
  String get invalid_qr => 'QR inválido';

  @override
  String get api_key_not_found => 'API Key não encontrada';

  @override
  String get boss_panel_title => 'Painel Chefe';

  @override
  String get import_sales => 'IMPORTAR BD';

  @override
  String get import_sales_subtitle => 'Importar arquivo JSON do funcionário';

  @override
  String get view_history => 'VER HISTÓRICO';

  @override
  String get view_history_subtitle => 'Todas as vendas importadas';

  @override
  String get delete_sales => 'EXCLUIR VENDAS';

  @override
  String get delete_sales_subtitle => 'Excluir todo o histórico';

  @override
  String get delete_imported_db => 'Excluir BD Importado';

  @override
  String get delete_all_imported_confirm =>
      'Excluir todas as vendas importadas?';

  @override
  String get cancel_button => 'Cancelar';

  @override
  String get delete_button => 'Excluir';

  @override
  String get import_button => 'Importar';

  @override
  String get sales_imported => 'vendas importadas';

  @override
  String get imported_db_deleted => 'BD excluído';

  @override
  String get employee_name => 'Funcionário';

  @override
  String get total_sales => 'Vendas';

  @override
  String get total_sats_label => 'Total sats';

  @override
  String get employee_panel_title => 'Painel de Vendas';

  @override
  String get new_sale => 'NOVA VENDA';

  @override
  String get new_sale_subtitle => 'Iniciar uma nova venda';

  @override
  String get pending_sales => 'VENDAS PENDENTES';

  @override
  String get pending_sales_subtitle => 'Ver vendas pendentes';

  @override
  String get total_today => 'Total Hoje';

  @override
  String get sales_count => 'Vendas';

  @override
  String get sale_title => 'Nova Venda';

  @override
  String get add_product => 'Adicionar Produto';

  @override
  String get product_name => 'Produto';

  @override
  String get product_price => 'Preço';

  @override
  String get quantity => 'Quantidade';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get total => 'Total';

  @override
  String get clear_cart => 'Limpar';

  @override
  String get process_sale => 'PROCESSAR VENDA';

  @override
  String get sale_processing => 'PROCESSANDO...';

  @override
  String get no_products => 'Sem produtos';

  @override
  String get scan_product => 'Escanear Produto';

  @override
  String get manual_product => 'Adicionar Manual';

  @override
  String get select_currency => 'Moeda';

  @override
  String get currency_usd => 'USD - Dólar';

  @override
  String get currency_eur => 'EUR - Euro';

  @override
  String get currency_cup => 'CUP - Peso Cubano';

  @override
  String get currency_mlc => 'MLC - Moeda Conversível';

  @override
  String get mlc_full_name => 'MLC - Moeda Conversível (CBDC)';

  @override
  String get currency_gbp => 'GBP - Libra Esterlina';

  @override
  String get currency_cad => 'CAD - Dólar Canadense';

  @override
  String get currency_jpy => 'JPY - Iene Japonês';

  @override
  String get currency_aud => 'AUD - Dólar Australiano';

  @override
  String get currency_chf => 'CHF - Franco Suíço';

  @override
  String get currency_sat => 'SAT - Satoshis';

  @override
  String get cur_name_usd => 'Dólar';

  @override
  String get cur_name_eur => 'Euro';

  @override
  String get cur_name_cup => 'Peso Cubano';

  @override
  String get cur_name_mlc => 'Moeda Conversível';

  @override
  String get cur_name_gbp => 'Libra Esterlina';

  @override
  String get cur_name_cad => 'Dólar Canadense';

  @override
  String get cur_name_jpy => 'Iene Japonês';

  @override
  String get cur_name_aud => 'Dólar Australiano';

  @override
  String get cur_name_chf => 'Franco Suíço';

  @override
  String get cur_name_sat => 'Satoshis';

  @override
  String get history_title => 'Histórico de Vendas';

  @override
  String get filter_by_date => 'Filtrar por data';

  @override
  String get filter_by_employee => 'Filtrar por funcionário';

  @override
  String get no_sales => 'Sem vendas';

  @override
  String get export_sales => 'Exportar';

  @override
  String get export_json => 'Exportar JSON';

  @override
  String get export_csv => 'Exportar CSV';

  @override
  String get sale_date => 'Data';

  @override
  String get sale_employee => 'Funcionário';

  @override
  String get sale_total => 'Total';

  @override
  String get sale_items => 'Produtos';

  @override
  String get settings_title => 'Configurações';

  @override
  String get language_settings => 'Idioma';

  @override
  String get currency_settings => 'Moedas';

  @override
  String get server_settings => 'Servidor';

  @override
  String get about_app => 'Sobre';

  @override
  String get logout => 'Sair';

  @override
  String get about_title => 'Sobre LaChispaPOS';

  @override
  String get about_version => 'Versão';

  @override
  String get about_description =>
      'Lightning POS - Um aplicativo para gerenciar vendas usando Bitcoin através da Lightning Network.';

  @override
  String get pending_sale_title => 'Venda Pendente';

  @override
  String get pending_sale_message => 'Você tem uma venda pendente:';

  @override
  String get continue_sale => 'Continuar';

  @override
  String get discard_sale => 'Descartar';

  @override
  String get discard_table => 'Descartar mesa';

  @override
  String get error_generic => 'Erro';

  @override
  String get success => 'Sucesso';

  @override
  String get loading => 'Carregando...';

  @override
  String get retry => 'Tentar novamente';

  @override
  String get confirm => 'Confirmar';

  @override
  String get yes => 'Sim';

  @override
  String get no => 'Não';

  @override
  String get ok => 'OK';

  @override
  String get save => 'Salvar';

  @override
  String get close => 'Fechar';

  @override
  String get select_language => 'Selecionar idioma';

  @override
  String get invoice_key_qr_title => 'QR Chave de Fatura';

  @override
  String get no_invoice_key_configured => 'Nenhuma Invoice Key configurada';

  @override
  String get select_currencies_hint => 'Selecione as moedas que deseja usar';

  @override
  String get invoice_qr_title => 'QR Fatura';

  @override
  String get copy_button => 'Copiar';

  @override
  String get step_connect_1 => 'Abra LaChispa (carteira do owner)';

  @override
  String get step_connect_2 => 'Menu lateral > QR Chave de Fatura';

  @override
  String get step_connect_3 => 'O QR será exibido para escanear';

  @override
  String get step_connect_4 => 'Escaneie o QR do app POS';

  @override
  String get steps_subtitle => 'O QR contém a URL e a API Key juntos';

  @override
  String get features_title => 'FUNÇÕES';

  @override
  String get roles_title => 'FUNÇÕES';

  @override
  String get how_to_connect => 'COMO CONECTAR';

  @override
  String get steps_title => 'Passos para conectar:';

  @override
  String get developed_with => 'Desenvolvido com';

  @override
  String get no_sales_to_export => 'Sem vendas para exportar';

  @override
  String get sales_deleted => 'Vendas excluídas';

  @override
  String get employee => 'Funcionário';

  @override
  String get delete_sale_confirm => 'Excluir esta venda?';

  @override
  String get delete_sales_title => 'Excluir Vendas';

  @override
  String get import_sales_title => 'Importar Vendas';

  @override
  String get invalid_price => 'Preço inválido';

  @override
  String get enter_product_and_price => 'Informe produto e preço';

  @override
  String get empty_cart => 'Carrinho vazio';

  @override
  String get configure_api_in_settings => 'Configure API em Configurações';

  @override
  String get error_creating_invoice => 'Erro ao criar invoice';

  @override
  String get payment_received => 'Pagamento recebido!';

  @override
  String get payment_error => 'Erro no pagamento';

  @override
  String get waiting_for_payment => 'Aguardando Pagamento';

  @override
  String get cobrar => 'COBRAR';

  @override
  String get copiado => 'Copiado';

  @override
  String get compartir => 'Compartilhar';

  @override
  String get pending_sale_confirm =>
      'Você tem uma venda pendente. Deseja retomá-la?';

  @override
  String get retomar => 'Retomar';

  @override
  String get discard_confirm => 'Excluir todas as vendas importadas?';

  @override
  String get pay_with_nfc => 'Pagar com NFC';

  @override
  String get nfc_not_available => 'NFC não disponível';

  @override
  String get nfc_ready => 'Aproxime o dispositivo do cliente';

  @override
  String get nfc_payment_cancelled => 'Pagamento NFC cancelado';

  @override
  String get nfc_error => 'Erro NFC';

  @override
  String get tap_to_pay => 'Toque para pagar';

  @override
  String get nfc_reading => 'Lendo NFC...';

  @override
  String get lnurl_error => 'Erro do servidor';

  @override
  String get drawer_stats => 'ESTATÍSTICAS';

  @override
  String get drawer_stats_subtitle => 'Vendas, gráficos e top produtos';

  @override
  String get drawer_catalog => 'CATÁLOGO';

  @override
  String get drawer_catalog_subtitle => 'Gerenciar produtos';

  @override
  String get drawer_import_sales => 'IMPORTAR VENDAS';

  @override
  String get drawer_import_sales_subtitle => 'Importar vendas de funcionários';

  @override
  String get drawer_export_sales => 'EXPORTAR VENDAS';

  @override
  String get drawer_export_sales_subtitle => 'Exportar vendas para JSON';

  @override
  String get drawer_import_catalog => 'IMPORTAR CATÁLOGO';

  @override
  String get drawer_import_catalog_subtitle => 'Produtos do chefe';

  @override
  String get drawer_delete_imported_subtitle => 'Excluir vendas importadas';

  @override
  String get drawer_logout => 'Sair';

  @override
  String get catalog_title => 'Catálogo de Produtos';

  @override
  String get catalog_new_product => 'Novo Produto';

  @override
  String get catalog_edit_product => 'Editar Produto';

  @override
  String get catalog_product_name_label => 'Nome';

  @override
  String get catalog_product_name_hint => 'Nome do produto';

  @override
  String get catalog_product_price_label => 'Preço';

  @override
  String get catalog_product_currency_label => 'Moeda';

  @override
  String get catalog_category_label => 'Categoria (opcional)';

  @override
  String get catalog_category_hint => 'Ex: Bebidas, Comidas';

  @override
  String get catalog_save => 'Salvar';

  @override
  String get catalog_add => 'Adicionar';

  @override
  String get catalog_delete_title => 'Excluir Produto';

  @override
  String catalog_delete_confirm(Object productName) {
    return 'Excluir \"$productName\"?';
  }

  @override
  String get catalog_export_tooltip => 'Exportar catálogo';

  @override
  String get catalog_no_products => 'Nenhum produto';

  @override
  String get catalog_add_first => 'Adicionar primeiro produto';

  @override
  String get catalog_import_title => 'Importar Catálogo';

  @override
  String catalog_import_confirm(Object count) {
    return 'Importar $count produtos?';
  }

  @override
  String catalog_imported(Object count) {
    return '$count produtos importados';
  }

  @override
  String get catalog_invalid_file => 'Arquivo de catálogo inválido';

  @override
  String get catalog_name_price_required => 'Nombre y precio son requeridos';

  @override
  String get catalog_valid_price_required =>
      'Ingrese un precio válido positivo';

  @override
  String get receipt_title => 'Recibo';

  @override
  String get receipt_brand => 'LA CHISPA';

  @override
  String get receipt_subtitle => 'Lightning POS';

  @override
  String get receipt_employee => 'Funcionário';

  @override
  String get receipt_date => 'Data';

  @override
  String get receipt_total => 'TOTAL';

  @override
  String get receipt_sats => 'sats';

  @override
  String get receipt_thanks => 'Obrigado pela sua compra!';

  @override
  String get receipt_website => 'lachispa.me';

  @override
  String get receipt_share => 'Compartilhar Recibo';

  @override
  String get receipt_new_sale => 'Nova Venda';

  @override
  String get receipt_share_tooltip => 'Compartilhar';

  @override
  String get currency_mismatch_title => 'Moedas diferentes';

  @override
  String currency_mismatch_message(Object currency) {
    return 'Não é possível misturar moedas na mesma venda. A venda atual está em $currency. Finalize ou cancele a venda atual para mudar de moeda.';
  }

  @override
  String get got_it => 'Entendi';

  @override
  String get confirm_table => 'Confirmar';

  @override
  String get manual_entry_tooltip => 'Entrada manual';

  @override
  String get catalog_mode_tooltip => 'Catálogo';

  @override
  String get search_products_hint => 'Buscar produtos...';

  @override
  String no_results_in_currency(Object currency) {
    return 'Sem resultados em $currency';
  }

  @override
  String no_products_in_currency(Object currency) {
    return 'Nenhum produto em $currency';
  }

  @override
  String get try_other_currency => 'Tente outra moeda';

  @override
  String get product_label => 'Produto';

  @override
  String get name_hint => 'Nome';

  @override
  String get price_label => 'Preço';

  @override
  String get add_products_hint => 'Adicione produtos';

  @override
  String invoice_memo(Object userName) {
    return 'Venda POS - $userName';
  }

  @override
  String get settings_manual_entry => 'Ou insira manualmente:';

  @override
  String get settings_url_label => 'URL';

  @override
  String get settings_url_hint =>
      'https://lachispa.me ou http://192.168.1.x:5000';

  @override
  String get settings_api_key_label => 'Chave API';

  @override
  String get settings_ticket_section => 'Recibo';

  @override
  String get settings_ticket_description =>
      'Após cada venda você pode compartilhar o recibo como texto. Suporte para impressora térmica será adicionado posteriormente.';

  @override
  String get stats_title => 'Estatísticas';

  @override
  String get stats_last_7_days => 'Vendas últimos 7 dias';

  @override
  String get stats_top_products => 'Top Produtos';

  @override
  String get stats_by_employee => 'Por Funcionário';

  @override
  String get stats_today => 'Hoje';

  @override
  String get stats_week => 'Semana';

  @override
  String get stats_month => 'Mês';

  @override
  String get stats_no_data => 'Sem dados';

  @override
  String get stats_sales_unit => 'vendas';

  @override
  String get stats_sats_unit => 'sats';

  @override
  String get total_label => 'TOTAL';

  @override
  String get btc_unit => 'BTC';

  @override
  String get history_ticket => 'Recibo';

  @override
  String get history_delete => 'Excluir';

  @override
  String get print_subject => 'Recibo de venda LaChispaPOS';

  @override
  String get print_header => 'LA  CHISPA';

  @override
  String get print_subtitle => 'Lightning POS';

  @override
  String get print_thanks => '  Obrigado pela sua compra!';

  @override
  String get print_url => '  lachispa.me';

  @override
  String get print_invoice => 'Fatura:';

  @override
  String get export_subject => 'Exportação de vendas POS Lightning';

  @override
  String get export_invalid_json => 'Arquivo JSON inválido';

  @override
  String get export_unknown => 'Desconhecido';

  @override
  String get export_imported_name => 'Importado';

  @override
  String get export_catalog_subject => 'Catálogo de produtos LaChispaPOS';

  @override
  String get table_label => 'Mesa';

  @override
  String get tables_title => 'Mesas';

  @override
  String get tables_active_title => 'Mesas activas';

  @override
  String get about_sale_desc =>
      'Inicie e processe vendas com Lightning Network';

  @override
  String get about_multicurrency_desc =>
      'Suporta 10 moedas com taxas em tempo real';

  @override
  String get about_exchange_rates => 'Taxas de Câmbio';

  @override
  String get about_exchange_desc => 'Cotações em tempo real via Yadio.io';

  @override
  String get about_export_desc => 'Exporte vendas para JSON';

  @override
  String get about_import_desc => 'Importe vendas de funcionários';

  @override
  String get about_catalog_desc => 'Produtos com nomes, preços e categorias';

  @override
  String get about_nfc_desc => 'Pague com NFC usando LNURL';

  @override
  String get about_tables_desc => 'Organize vendas por mesas';

  @override
  String get about_stats_desc => 'Gráficos, tendências e produtos top';

  @override
  String get about_receipt_desc => 'Compartilhe recibo após cada venda';

  @override
  String get about_multilang_desc => 'Disponível em 8 idiomas';
}
