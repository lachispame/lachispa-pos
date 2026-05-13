// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get welcome_title => 'La Chispa';

  @override
  String get welcome_subtitle => 'Lightning POS';

  @override
  String get get_started_button => 'НАЧАТЬ';

  @override
  String get login_title => 'LaChispaPOS';

  @override
  String get login_subtitle => 'Lightning POS';

  @override
  String get username_label => 'Имя';

  @override
  String get username_placeholder => 'Введите ваше имя';

  @override
  String get username_required_error => 'Введите ваше имя';

  @override
  String get select_role => 'Выбрать роль';

  @override
  String get employee_role => 'Сотрудник';

  @override
  String get boss_role => 'Начальник';

  @override
  String get login_button => 'ВХОД';

  @override
  String get scan_qr_button => 'Сканировать QR ключ API';

  @override
  String get verifying_api_key => 'Проверка ключа API...';

  @override
  String get api_key_error => 'Ошибка: Проверьте ключ API';

  @override
  String get invalid_qr => 'Неверный QR';

  @override
  String get api_key_not_found => 'Ключ API не найден';

  @override
  String get boss_panel_title => 'Панель начальника';

  @override
  String get import_sales => 'ИМПОРТ БД';

  @override
  String get import_sales_subtitle => 'Импорт JSON файла от сотрудника';

  @override
  String get view_history => 'ИСТОРИЯ';

  @override
  String get view_history_subtitle => 'Все импортированные продажи';

  @override
  String get delete_sales => 'УДАЛИТЬ ПРОДАЖИ';

  @override
  String get delete_sales_subtitle => 'Удалить всю историю';

  @override
  String get delete_imported_db => 'Удалить импортированную БД';

  @override
  String get delete_all_imported_confirm =>
      'Удалить все импортированные продажи?';

  @override
  String get cancel_button => 'Отмена';

  @override
  String get delete_button => 'Удалить';

  @override
  String get import_button => 'Импорт';

  @override
  String get sales_imported => 'продаж импортировано';

  @override
  String get imported_db_deleted => 'БД удалена';

  @override
  String get employee_name => 'Сотрудник';

  @override
  String get total_sales => 'Продажи';

  @override
  String get total_sats_label => 'Всего сат';

  @override
  String get employee_panel_title => 'Панель продаж';

  @override
  String get new_sale => 'НОВАЯ ПРОДАЖА';

  @override
  String get new_sale_subtitle => 'Начать новую продажу';

  @override
  String get pending_sales => 'ОЖИДАЮЩИЕ ПРОДАЖИ';

  @override
  String get pending_sales_subtitle => 'Просмотр ожидающих продаж';

  @override
  String get total_today => 'Итого сегодня';

  @override
  String get sales_count => 'Продажи';

  @override
  String get sale_title => 'Новая продажа';

  @override
  String get add_product => 'Добавить товар';

  @override
  String get product_name => 'Товар';

  @override
  String get product_price => 'Цена';

  @override
  String get quantity => 'Количество';

  @override
  String get subtotal => 'Подытог';

  @override
  String get total => 'Итого';

  @override
  String get clear_cart => 'Очистить';

  @override
  String get process_sale => 'ОБРАБОТАТЬ ПРОДАЖУ';

  @override
  String get sale_processing => 'ОБРАБОТКА...';

  @override
  String get no_products => 'Нет товаров';

  @override
  String get scan_product => 'Сканировать товар';

  @override
  String get manual_product => 'Добавить вручную';

  @override
  String get select_currency => 'Валюта';

  @override
  String get currency_usd => 'USD - Доллар';

  @override
  String get currency_eur => 'EUR - Евро';

  @override
  String get currency_cup => 'CUP - Кубинское песо';

  @override
  String get currency_mlc => 'MLC - Конвертируемая валюта';

  @override
  String get mlc_full_name => 'MLC - Конвертируемая валюта (ЦБВЦ)';

  @override
  String get currency_gbp => 'GBP - Британский фунт';

  @override
  String get currency_cad => 'CAD - Канадский доллар';

  @override
  String get currency_jpy => 'JPY - Японская иена';

  @override
  String get currency_aud => 'AUD - Австралийский доллар';

  @override
  String get currency_chf => 'CHF - Швейцарский франк';

  @override
  String get currency_sat => 'SAT - Сатоши';

  @override
  String get history_title => 'История продаж';

  @override
  String get filter_by_date => 'Фильтр по дате';

  @override
  String get filter_by_employee => 'Фильтр по сотруднику';

  @override
  String get no_sales => 'Нет продаж';

  @override
  String get export_sales => 'Экспорт';

  @override
  String get export_json => 'Экспорт JSON';

  @override
  String get export_csv => 'Экспорт CSV';

  @override
  String get sale_date => 'Дата';

  @override
  String get sale_employee => 'Сотрудник';

  @override
  String get sale_total => 'Итого';

  @override
  String get sale_items => 'Товары';

  @override
  String get settings_title => 'Настройки';

  @override
  String get language_settings => 'Язык';

  @override
  String get currency_settings => 'Валюты';

  @override
  String get server_settings => 'Сервер';

  @override
  String get about_app => 'О приложении';

  @override
  String get logout => 'Выйти';

  @override
  String get about_title => 'О LaChispaPOS';

  @override
  String get about_version => 'Версия';

  @override
  String get about_description =>
      'Lightning POS - Приложение для управления продажами с использованием Bitcoin через Lightning Network.';

  @override
  String get pending_sale_title => 'Ожидающая продажа';

  @override
  String get pending_sale_message => 'У вас есть ожидающая продажа:';

  @override
  String get continue_sale => 'Продолжить';

  @override
  String get discard_sale => 'Отменить';

  @override
  String get error_generic => 'Ошибка';

  @override
  String get success => 'Успешно';

  @override
  String get loading => 'Загрузка...';

  @override
  String get retry => 'Повторить';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get yes => 'Да';

  @override
  String get no => 'Нет';

  @override
  String get ok => 'ОК';

  @override
  String get save => 'Сохранить';

  @override
  String get close => 'Закрыть';

  @override
  String get select_language => 'Выбрать язык';

  @override
  String get invoice_key_qr_title => 'QR Ключ Счета';

  @override
  String get no_invoice_key_configured => 'Ключ счета не настроен';

  @override
  String get select_currencies_hint => 'Выберите валюты для использования';

  @override
  String get invoice_qr_title => 'QR Счета';

  @override
  String get copy_button => 'Копировать';

  @override
  String get step_connect_1 => 'Откройте LaChispa (кошелек владельца)';

  @override
  String get step_connect_2 => 'Боковое меню > QR Ключ Счета';

  @override
  String get step_connect_3 => 'QR будет отображен для сканирования';

  @override
  String get step_connect_4 => 'Сканируйте QR из приложения POS';

  @override
  String get steps_subtitle => 'QR содержит URL и ключ API вместе';

  @override
  String get features_title => 'ФУНКЦИИ';

  @override
  String get roles_title => 'РОЛИ';

  @override
  String get how_to_connect => 'КАК ПОДКЛЮЧИТЬ';

  @override
  String get steps_title => 'Шаги для подключения:';

  @override
  String get developed_with => 'Разработано с';

  @override
  String get no_sales_to_export => 'Нет продаж для экспорта';

  @override
  String get sales_deleted => 'Продажи удалены';

  @override
  String get employee => 'Сотрудник';

  @override
  String get delete_sale_confirm => 'Удалить эту продажу?';

  @override
  String get delete_sales_title => 'Удалить продажи';

  @override
  String get import_sales_title => 'Импорт продаж';

  @override
  String get invalid_price => 'Неверная цена';

  @override
  String get enter_product_and_price => 'Введите товар и цену';

  @override
  String get empty_cart => 'Корзина пуста';

  @override
  String get configure_api_in_settings => 'Настройте API в Настройках';

  @override
  String get error_creating_invoice => 'Ошибка создания счета';

  @override
  String get payment_received => 'Платеж получен!';

  @override
  String get payment_error => 'Ошибка платежа';

  @override
  String get waiting_for_payment => 'Ожидание платежа';

  @override
  String get cobrar => 'ОПЛАТА';

  @override
  String get copiado => 'Скопировано';

  @override
  String get compartir => 'Поделиться';

  @override
  String get pending_sale_confirm =>
      'У вас есть ожидающая продажа. Хотите ее продолжить?';

  @override
  String get retomar => 'Продолжить';

  @override
  String get discard_confirm => 'Удалить все импортированные продажи?';

  @override
  String get pay_with_nfc => 'Оплатить через NFC';

  @override
  String get nfc_not_available => 'NFC недоступен';

  @override
  String get nfc_ready => 'Поднесите устройство к клиенту';

  @override
  String get nfc_payment_cancelled => 'Оплата NFC отменена';

  @override
  String get nfc_error => 'Ошибка NFC';

  @override
  String get tap_to_pay => 'Нажмите для оплаты';

  @override
  String get nfc_reading => 'Чтение NFC...';

  @override
  String get lnurl_error => 'Ошибка сервера';

  @override
  String get drawer_stats => 'СТАТИСТИКА';

  @override
  String get drawer_stats_subtitle => 'Продажи, графики и топ товаров';

  @override
  String get drawer_catalog => 'КАТАЛОГ';

  @override
  String get drawer_catalog_subtitle => 'Управление товарами';

  @override
  String get drawer_import_sales => 'ИМПОРТ ПРОДАЖ';

  @override
  String get drawer_import_sales_subtitle => 'Импорт продаж от сотрудников';

  @override
  String get drawer_export_sales => 'ЭКСПОРТ ПРОДАЖ';

  @override
  String get drawer_export_sales_subtitle => 'Экспорт продаж в JSON';

  @override
  String get drawer_import_catalog => 'ИМПОРТ КАТАЛОГА';

  @override
  String get drawer_import_catalog_subtitle => 'Товары начальника';

  @override
  String get drawer_delete_imported_subtitle =>
      'Удалить импортированные продажи';

  @override
  String get drawer_logout => 'Выйти';

  @override
  String get catalog_title => 'Каталог товаров';

  @override
  String get catalog_new_product => 'Новый товар';

  @override
  String get catalog_edit_product => 'Редактировать товар';

  @override
  String get catalog_product_name_label => 'Название';

  @override
  String get catalog_product_name_hint => 'Название товара';

  @override
  String get catalog_product_price_label => 'Цена';

  @override
  String get catalog_product_currency_label => 'Валюта';

  @override
  String get catalog_category_label => 'Категория (необязательно)';

  @override
  String get catalog_category_hint => 'Напр.: Напитки, Еда';

  @override
  String get catalog_save => 'Сохранить';

  @override
  String get catalog_add => 'Добавить';

  @override
  String get catalog_delete_title => 'Удалить товар';

  @override
  String catalog_delete_confirm(Object productName) {
    return 'Удалить \"$productName\"?';
  }

  @override
  String get catalog_export_tooltip => 'Экспорт каталога';

  @override
  String get catalog_no_products => 'Нет товаров';

  @override
  String get catalog_add_first => 'Добавить первый товар';

  @override
  String get catalog_import_title => 'Импорт каталога';

  @override
  String catalog_import_confirm(Object count) {
    return 'Импортировать $count товаров?';
  }

  @override
  String catalog_imported(Object count) {
    return 'Импортировано $count товаров';
  }

  @override
  String get catalog_invalid_file => 'Неверный файл каталога';

  @override
  String get receipt_title => 'Чек';

  @override
  String get receipt_brand => 'LA CHISPA';

  @override
  String get receipt_subtitle => 'Lightning POS';

  @override
  String get receipt_employee => 'Сотрудник';

  @override
  String get receipt_date => 'Дата';

  @override
  String get receipt_total => 'ИТОГО';

  @override
  String get receipt_sats => 'сат';

  @override
  String get receipt_thanks => 'Спасибо за покупку!';

  @override
  String get receipt_website => 'lachispa.me';

  @override
  String get receipt_share => 'Поделиться чеком';

  @override
  String get receipt_new_sale => 'Новая продажа';

  @override
  String get receipt_share_tooltip => 'Поделиться';

  @override
  String get currency_mismatch_title => 'Разные валюты';

  @override
  String currency_mismatch_message(Object currency) {
    return 'Нельзя смешивать валюты в одной продаже. Текущая продажа в $currency. Завершите или отмените продажу чтобы сменить валюту.';
  }

  @override
  String get got_it => 'Понятно';

  @override
  String get manual_entry_tooltip => 'Ручной ввод';

  @override
  String get catalog_mode_tooltip => 'Каталог';

  @override
  String get search_products_hint => 'Поиск товаров...';

  @override
  String no_results_in_currency(Object currency) {
    return 'Нет результатов в $currency';
  }

  @override
  String no_products_in_currency(Object currency) {
    return 'Нет товаров в $currency';
  }

  @override
  String get try_other_currency => 'Попробуйте другую валюту';

  @override
  String get product_label => 'Товар';

  @override
  String get name_hint => 'Название';

  @override
  String get price_label => 'Цена';

  @override
  String get add_products_hint => 'Добавьте товары';

  @override
  String invoice_memo(Object userName) {
    return 'POS продажа - $userName';
  }

  @override
  String get settings_manual_entry => 'Или введите вручную:';

  @override
  String get settings_url_label => 'URL';

  @override
  String get settings_url_hint =>
      'https://lachispa.me или http://192.168.1.x:5000';

  @override
  String get settings_api_key_label => 'API ключ';

  @override
  String get settings_ticket_section => 'Чек';

  @override
  String get settings_ticket_description =>
      'После каждой продажи вы можете поделиться чеком как текстом. Поддержка термопринтера будет добавлена позже.';

  @override
  String get stats_title => 'Статистика';

  @override
  String get stats_last_7_days => 'Продажи за 7 дней';

  @override
  String get stats_top_products => 'Топ товаров';

  @override
  String get stats_by_employee => 'По сотрудникам';

  @override
  String get stats_today => 'Сегодня';

  @override
  String get stats_week => 'Неделя';

  @override
  String get stats_month => 'Месяц';

  @override
  String get stats_no_data => 'Нет данных';

  @override
  String get stats_sales_unit => 'продаж';

  @override
  String get stats_sats_unit => 'сат';

  @override
  String get total_label => 'ИТОГО';

  @override
  String get btc_unit => 'BTC';

  @override
  String get history_ticket => 'Чек';

  @override
  String get history_delete => 'Удалить';

  @override
  String get print_subject => 'Чек продажи LaChispaPOS';

  @override
  String get print_header => 'LA  CHISPA';

  @override
  String get print_subtitle => 'Lightning POS';

  @override
  String get print_thanks => '  Спасибо за покупку!';

  @override
  String get print_url => '  lachispa.me';

  @override
  String get export_subject => 'Экспорт продаж POS Lightning';

  @override
  String get export_invalid_json => 'Неверный JSON файл';

  @override
  String get export_unknown => 'Неизвестно';

  @override
  String get export_imported_name => 'Импортировано';

  @override
  String get export_catalog_subject => 'Каталог товаров LaChispaPOS';
}
