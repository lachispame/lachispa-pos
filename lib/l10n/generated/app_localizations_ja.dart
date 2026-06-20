// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get welcome_title => 'La Chispa';

  @override
  String get welcome_subtitle => 'Lightning POS';

  @override
  String get get_started_button => '始める';

  @override
  String get login_title => 'LaChispaPOS';

  @override
  String get login_subtitle => 'Lightning POS';

  @override
  String get username_label => '名前';

  @override
  String get username_placeholder => '名前を入力';

  @override
  String get username_required_error => '名前を入力してください';

  @override
  String get select_role => '役割を選択';

  @override
  String get employee_role => '従業員';

  @override
  String get boss_role => '店主';

  @override
  String get login_button => 'ログイン';

  @override
  String get scan_qr_button => 'API Key QRをスキャン';

  @override
  String get verifying_api_key => 'API Keyを確認中...';

  @override
  String get api_key_error => 'エラー: API Keyを確認してください';

  @override
  String get invalid_qr => '無効なQR';

  @override
  String get api_key_not_found => 'API Keyが見つかりません';

  @override
  String get boss_panel_title => '店主パネル';

  @override
  String get import_sales => 'DBインポート';

  @override
  String get import_sales_subtitle => '従業員のJSONファイルをインポート';

  @override
  String get view_history => '履歴を見る';

  @override
  String get view_history_subtitle => 'インポートされたすべての売上';

  @override
  String get delete_sales => '売上を削除';

  @override
  String get delete_sales_subtitle => 'すべての履歴を削除';

  @override
  String get delete_imported_db => 'インポートDBを削除';

  @override
  String get delete_all_imported_confirm => 'すべてのインポートされた売上を削除しますか？';

  @override
  String get cancel_button => 'キャンセル';

  @override
  String get delete_button => '削除';

  @override
  String get import_button => 'インポート';

  @override
  String get sales_imported => '件の売上をインポート';

  @override
  String get imported_db_deleted => 'DBを削除しました';

  @override
  String get employee_name => '従業員';

  @override
  String get total_sales => '売上';

  @override
  String get total_sats_label => '合計sats';

  @override
  String get employee_panel_title => '売上パネル';

  @override
  String get new_sale => '新規売上';

  @override
  String get new_sale_subtitle => '新しい売上を開始';

  @override
  String get pending_sales => '保留中の売上';

  @override
  String get pending_sales_subtitle => '保留中の売上を表示';

  @override
  String get total_today => '本日の合計';

  @override
  String get sales_count => '件数';

  @override
  String get sale_title => '新規売上';

  @override
  String get add_product => '商品を追加';

  @override
  String get product_name => '商品';

  @override
  String get product_price => '価格';

  @override
  String get quantity => '数量';

  @override
  String get subtotal => '小計';

  @override
  String get total => '合計';

  @override
  String get clear_cart => 'クリア';

  @override
  String get process_sale => '売上を処理';

  @override
  String get sale_processing => '処理中...';

  @override
  String get no_products => '商品がありません';

  @override
  String get scan_product => '商品をスキャン';

  @override
  String get manual_product => '手動で追加';

  @override
  String get select_currency => '通貨';

  @override
  String get currency_usd => 'USD - 米ドル';

  @override
  String get currency_eur => 'EUR - ユーロ';

  @override
  String get currency_cup => 'CUP - キューバペソ';

  @override
  String get currency_mlc => 'MLC - 兌換通貨';

  @override
  String get mlc_full_name => 'MLC - 兌換通貨 (CBDC)';

  @override
  String get currency_gbp => 'GBP - 英ポンド';

  @override
  String get currency_cad => 'CAD - カナダドル';

  @override
  String get currency_jpy => 'JPY - 日本円';

  @override
  String get currency_aud => 'AUD -豪ドル';

  @override
  String get currency_chf => 'CHF - スイスフラン';

  @override
  String get currency_sat => 'SAT - サトシ';

  @override
  String get cur_name_usd => '米ドル';

  @override
  String get cur_name_eur => 'ユーロ';

  @override
  String get cur_name_cup => 'キューバペソ';

  @override
  String get cur_name_mlc => '兌換通貨';

  @override
  String get cur_name_gbp => '英ポンド';

  @override
  String get cur_name_cad => 'カナダドル';

  @override
  String get cur_name_jpy => '日本円';

  @override
  String get cur_name_aud => '豪ドル';

  @override
  String get cur_name_chf => 'スイスフラン';

  @override
  String get cur_name_sat => 'サトシ';

  @override
  String get history_title => '売上履歴';

  @override
  String get filter_by_date => '日付でフィルター';

  @override
  String get filter_by_employee => '従業員でフィルター';

  @override
  String get no_sales => '売上なし';

  @override
  String get export_sales => 'エクスポート';

  @override
  String get export_json => 'JSONエクスポート';

  @override
  String get export_csv => 'CSVエクスポート';

  @override
  String get sale_date => '日付';

  @override
  String get sale_employee => '従業員';

  @override
  String get sale_total => '合計';

  @override
  String get sale_items => '商品';

  @override
  String get settings_title => '設定';

  @override
  String get language_settings => '言語';

  @override
  String get currency_settings => '通貨';

  @override
  String get server_settings => 'サーバー';

  @override
  String get about_app => 'アプリについて';

  @override
  String get logout => 'ログアウト';

  @override
  String get about_title => 'LaChispaPOSについて';

  @override
  String get about_version => 'バージョン';

  @override
  String get about_description =>
      'Lightning POS - BitcoinとLightning Networkを使用した売上管理アプリ';

  @override
  String get pending_sale_title => '保留中の売上';

  @override
  String get pending_sale_message => '保留中の売上があります：';

  @override
  String get continue_sale => '続ける';

  @override
  String get discard_sale => '破棄';

  @override
  String get discard_table => 'テーブルを破棄';

  @override
  String get error_generic => 'エラー';

  @override
  String get success => '成功';

  @override
  String get loading => '読み込み中...';

  @override
  String get retry => '再試行';

  @override
  String get confirm => '確認';

  @override
  String get yes => 'はい';

  @override
  String get no => 'いいえ';

  @override
  String get ok => 'OK';

  @override
  String get save => '保存';

  @override
  String get close => '閉じる';

  @override
  String get select_language => '言語を選択';

  @override
  String get invoice_key_qr_title => '請求キーQRコード';

  @override
  String get no_invoice_key_configured => '請求キーが設定されていません';

  @override
  String get select_currencies_hint => '使用する通貨を選択してください';

  @override
  String get invoice_qr_title => '請求書QR';

  @override
  String get copy_button => 'コピー';

  @override
  String get step_connect_1 => 'LaChispaを開く（店主のウォレット）';

  @override
  String get step_connect_2 => 'サイドメニュー > 請求キーQRコード';

  @override
  String get step_connect_3 => 'スキャン用のQRが表示されます';

  @override
  String get step_connect_4 => 'POSアプリからQRをスキャン';

  @override
  String get steps_subtitle => 'QRにはURLとAPI Keyが含まれています';

  @override
  String get features_title => '機能';

  @override
  String get roles_title => '役割';

  @override
  String get how_to_connect => '接続方法';

  @override
  String get steps_title => '接続手順：';

  @override
  String get developed_with => '開発技術';

  @override
  String get no_sales_to_export => 'エクスポートする売上がありません';

  @override
  String get sales_deleted => '売上を削除しました';

  @override
  String get employee => '従業員';

  @override
  String get delete_sale_confirm => 'この売上を削除しますか？';

  @override
  String get delete_sales_title => '売上を削除';

  @override
  String get import_sales_title => '売上をインポート';

  @override
  String get invalid_price => '無効な価格';

  @override
  String get enter_product_and_price => '商品名と価格を入力';

  @override
  String get empty_cart => 'カートが空です';

  @override
  String get configure_api_in_settings => '設定でAPIを設定してください';

  @override
  String get error_creating_invoice => '請求書作成エラー';

  @override
  String get payment_received => '支払い完了！';

  @override
  String get payment_error => '支払いエラー';

  @override
  String get waiting_for_payment => '支払い待ち';

  @override
  String get cobrar => '請求';

  @override
  String get copiado => 'コピーしました';

  @override
  String get compartir => '共有';

  @override
  String get pending_sale_confirm => '保留中の売上があります。続けますか？';

  @override
  String get retomar => '続ける';

  @override
  String get discard_confirm => 'すべてのインポートされた売上を削除しますか？';

  @override
  String get pay_with_nfc => 'NFCで支払う';

  @override
  String get nfc_not_available => 'NFCが利用できません';

  @override
  String get nfc_ready => 'デバイスをお客様に近づけてください';

  @override
  String get nfc_payment_cancelled => 'NFC支払いがキャンセルされました';

  @override
  String get nfc_error => 'NFCエラー';

  @override
  String get tap_to_pay => 'タップして支払う';

  @override
  String get nfc_reading => 'NFC読み取り中...';

  @override
  String get lnurl_error => 'サーバーエラー';

  @override
  String get connection_error => 'サーバーに接続できませんでした。インターネット接続を確認してください。';

  @override
  String get server_error => 'サーバーエラー。後でもう一度お試しください。';

  @override
  String get drawer_stats => '統計';

  @override
  String get drawer_stats_subtitle => '売上、グラフ、トップ商品';

  @override
  String get drawer_catalog => 'カタログ';

  @override
  String get drawer_catalog_subtitle => '商品管理';

  @override
  String get drawer_import_sales => '売上をインポート';

  @override
  String get drawer_import_sales_subtitle => '従業員から売上をインポート';

  @override
  String get drawer_export_sales => '売上をエクスポート';

  @override
  String get drawer_export_sales_subtitle => '売上をJSONにエクスポート';

  @override
  String get drawer_export_catalog => 'EXPORTAR CATÁLOGO';

  @override
  String get drawer_export_catalog_subtitle =>
      'Compartir productos con dependientes';

  @override
  String get drawer_import_catalog => 'カタログをインポート';

  @override
  String get drawer_import_catalog_subtitle => 'ボスの商品';

  @override
  String get drawer_delete_imported_subtitle => 'インポートされた売上を削除';

  @override
  String get drawer_logout => 'ログアウト';

  @override
  String get catalog_title => '商品カタログ';

  @override
  String get catalog_new_product => '新商品';

  @override
  String get catalog_edit_product => '商品を編集';

  @override
  String get catalog_product_name_label => '名前';

  @override
  String get catalog_product_name_hint => '商品名';

  @override
  String get catalog_product_price_label => '価格';

  @override
  String get catalog_product_currency_label => '通貨';

  @override
  String get catalog_category_label => 'カテゴリ（任意）';

  @override
  String get catalog_category_hint => '例：飲み物、食品';

  @override
  String get catalog_save => '保存';

  @override
  String get catalog_add => '追加';

  @override
  String get catalog_delete_title => '商品を削除';

  @override
  String catalog_delete_confirm(Object productName) {
    return '\"$productName\"を削除しますか？';
  }

  @override
  String get catalog_export_tooltip => 'カタログをエクスポート';

  @override
  String get catalog_no_products => '商品がありません';

  @override
  String get catalog_add_first => '最初の商品を追加';

  @override
  String get catalog_import_title => 'カタログをインポート';

  @override
  String catalog_import_confirm(Object count) {
    return '$count個の商品をインポートしますか？';
  }

  @override
  String catalog_imported(Object count) {
    return '$count個の商品をインポートしました';
  }

  @override
  String get catalog_invalid_file => '無効なカタログファイル';

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
  String get receipt_title => 'レシート';

  @override
  String get receipt_brand => 'LA CHISPA';

  @override
  String get receipt_subtitle => 'Lightning POS';

  @override
  String get receipt_employee => '従業員';

  @override
  String get receipt_date => '日付';

  @override
  String get receipt_total => '合計';

  @override
  String get receipt_sats => 'sats';

  @override
  String get receipt_thanks => 'ご購入ありがとうございます！';

  @override
  String get receipt_website => 'lachispa.me';

  @override
  String get receipt_share => 'レシートを共有';

  @override
  String get receipt_new_sale => '新規販売';

  @override
  String get receipt_share_tooltip => '共有';

  @override
  String get currency_mismatch_title => '通貨が異なります';

  @override
  String currency_mismatch_message(Object currency) {
    return '同じ販売で通貨を混在させることはできません。現在の販売は$currencyです。販売を完了またはキャンセルして通貨を変更してください。';
  }

  @override
  String get got_it => 'わかりました';

  @override
  String get confirm_table => '確認';

  @override
  String get manual_entry_tooltip => '手動入力';

  @override
  String get catalog_mode_tooltip => 'カタログ';

  @override
  String get search_products_hint => '商品を検索...';

  @override
  String no_results_in_currency(Object currency) {
    return '$currencyに結果がありません';
  }

  @override
  String no_products_in_currency(Object currency) {
    return '$currencyに商品がありません';
  }

  @override
  String get try_other_currency => '別の通貨をお試しください';

  @override
  String get product_label => '商品';

  @override
  String get name_hint => '名前';

  @override
  String get price_label => '価格';

  @override
  String get add_products_hint => '商品を追加してください';

  @override
  String invoice_memo(Object userName) {
    return 'POS販売 - $userName';
  }

  @override
  String get settings_manual_entry => 'または手動で入力：';

  @override
  String get settings_url_label => 'URL';

  @override
  String get settings_url_hint =>
      'https://lachispa.me または http://192.168.1.x:5000';

  @override
  String get settings_api_key_label => 'APIキー';

  @override
  String get settings_ticket_section => 'レシート';

  @override
  String get settings_ticket_description =>
      '各販売後にレシートをテキストとして共有できます。サーマルプリンターのサポートは後日追加されます。';

  @override
  String get stats_title => '統計';

  @override
  String get stats_last_7_days => '過去7日間の売上';

  @override
  String get stats_top_products => 'トップ商品';

  @override
  String get stats_by_employee => '従業員別';

  @override
  String get stats_today => '今日';

  @override
  String get stats_week => '週';

  @override
  String get stats_month => '月';

  @override
  String get stats_no_data => 'データなし';

  @override
  String get stats_sales_unit => '売上';

  @override
  String get stats_sats_unit => 'sats';

  @override
  String get total_label => '合計';

  @override
  String get btc_unit => 'BTC';

  @override
  String get history_ticket => 'レシート';

  @override
  String get history_delete => '削除';

  @override
  String get print_subject => 'LaChispaPOS販売レシート';

  @override
  String get print_header => 'LA  CHISPA';

  @override
  String get print_subtitle => 'Lightning POS';

  @override
  String get print_thanks => '  ご購入ありがとうございます！';

  @override
  String get print_url => '  lachispa.me';

  @override
  String get print_invoice => '請求書:';

  @override
  String get export_subject => 'POS Lightning売上エクスポート';

  @override
  String get export_invalid_json => '無効なJSONファイル';

  @override
  String get export_unknown => '不明';

  @override
  String get export_imported_name => 'インポート済み';

  @override
  String get export_catalog_subject => 'LaChispaPOS商品カタログ';

  @override
  String get table_label => 'Mesa';

  @override
  String get tables_title => 'Mesas';

  @override
  String get tables_active_title => 'Mesas activas';

  @override
  String get about_sale_desc => 'Lightning Networkで売上を開始・処理';

  @override
  String get about_multicurrency_desc => '10通貨対応、リアルタイムレート';

  @override
  String get about_exchange_rates => '為替レート';

  @override
  String get about_exchange_desc => 'Yadio.ioによるリアルタイム見積もり';

  @override
  String get about_export_desc => '売上をJSONにエクスポート';

  @override
  String get about_import_desc => '従業員から売上をインポート';

  @override
  String get about_catalog_desc => '商品名、価格、カテゴリを管理';

  @override
  String get about_nfc_desc => 'LNURLでNFC支払い';

  @override
  String get about_tables_desc => 'テーブルごとに売上を管理';

  @override
  String get about_stats_desc => 'グラフ、トレンド、人気商品';

  @override
  String get about_receipt_desc => '各売上後にレシートを共有';

  @override
  String get about_multilang_desc => '8言語対応';
}
