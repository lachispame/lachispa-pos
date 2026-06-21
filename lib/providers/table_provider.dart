import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart_item.dart';

class TableProvider extends ChangeNotifier {
  final Map<String, List<CartItem>> _tables = {};
  String? _currentTable;
  static const String _storageKey = 'active_tables_v2';

  Map<String, List<CartItem>> get tables => _tables;
  String? get currentTable => _currentTable;
  List<String> get activeTables => _tables.keys.toList()..sort();
  bool get hasActiveTable => _currentTable != null;

  List<CartItem> itemsForTable(String table) => _tables[table] ?? [];

  Future<void> loadSavedTables() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_storageKey);
    if (json == null) {
      await _migrateFromV1(prefs);
      return;
    }
    try {
      final decoded = jsonDecode(json) as Map<String, dynamic>;
      final temp = <String, List<CartItem>>{};
      for (final entry in decoded.entries) {
        final items = (entry.value as List)
            .map((m) => CartItem.fromMap(m as Map<String, dynamic>))
            .toList();
        temp[entry.key] = items;
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

  Future<void> _migrateFromV1(SharedPreferences prefs) async {
    const oldKey = 'active_tables';
    final oldJson = prefs.getString(oldKey);
    if (oldJson == null) return;

    try {
      final decoded = jsonDecode(oldJson) as Map<String, dynamic>;
      final migrated = <String, dynamic>{};
      for (final entry in decoded.entries) {
        migrated[entry.key] = entry.value;
      }
      await prefs.setString(_storageKey, jsonEncode(migrated));
      await prefs.remove(oldKey);
    } catch (e) {
      debugPrint('migrateFromV1 error: $e');
    }
  }

  Future<void> _persist() async {
    final prefs = await SharedPreferences.getInstance();
    final data = <String, dynamic>{};
    for (final entry in _tables.entries) {
      data[entry.key] = entry.value.map((i) => i.toMap()).toList();
    }
    await prefs.setString(_storageKey, jsonEncode(data));
  }

  Future<void> selectTable(String table) async {
    _currentTable = table;
    if (!_tables.containsKey(table)) {
      _tables[table] = [];
    }
    await _persist();
    notifyListeners();
  }

  Future<void> saveCartToTable(String table, List<CartItem> items) async {
    _tables[table] = List.from(items);
    await _persist();
    notifyListeners();
  }

  Future<void> closeTable(String table) async {
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

  int pendingQuantity(String productName) {
    int total = 0;
    for (final items in _tables.values) {
      for (final item in items) {
        if (item.nombre == productName) {
          total += item.cantidad;
        }
      }
    }
    return total;
  }
}
