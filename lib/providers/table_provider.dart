import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart_item.dart';

class TableProvider extends ChangeNotifier {
  final Map<int, List<CartItem>> _tables = {};
  int? _currentTable;
  static const String _storageKey = 'active_tables';

  Map<int, List<CartItem>> get tables => _tables;
  int? get currentTable => _currentTable;
  List<int> get activeTables => _tables.keys.toList()..sort();
  bool get hasActiveTable => _currentTable != null;

  List<CartItem> itemsForTable(int table) => _tables[table] ?? [];

  Future<void> loadSavedTables() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_storageKey);
    if (json == null) return;
    try {
      final decoded = jsonDecode(json) as Map<String, dynamic>;
      final temp = <int, List<CartItem>>{};
      for (final entry in decoded.entries) {
        final tableNum = int.parse(entry.key);
        final items = (entry.value as List)
            .map((m) => CartItem.fromMap(m as Map<String, dynamic>))
            .toList();
        temp[tableNum] = items;
      }
      _tables
        ..clear()
        ..addAll(temp);
      notifyListeners();
    } on FormatException catch (e, s) {
      debugPrint('loadSavedTables FormatException: $e\n$s');
      await prefs.remove(_storageKey);
    } on TypeError catch (e, s) {
      debugPrint('loadSavedTables TypeError: $e\n$s');
      await prefs.remove(_storageKey);
    }
  }

  Future<void> _persist() async {
    final prefs = await SharedPreferences.getInstance();
    final data = <String, dynamic>{};
    for (final entry in _tables.entries) {
      data[entry.key.toString()] = entry.value.map((i) => i.toMap()).toList();
    }
    await prefs.setString(_storageKey, jsonEncode(data));
  }

  Future<void> selectTable(int table) async {
    _currentTable = table;
    if (!_tables.containsKey(table)) {
      _tables[table] = [];
    }
    await _persist();
    notifyListeners();
  }

  Future<void> saveCartToTable(int table, List<CartItem> items) async {
    _tables[table] = List.from(items);
    await _persist();
    notifyListeners();
  }

  Future<void> closeTable(int table) async {
    _tables.remove(table);
    if (_currentTable == table) {
      _currentTable = null;
    }
    await _persist();
    notifyListeners();
  }

  void clearSelection() {
    _currentTable = null;
    notifyListeners();
  }
}
