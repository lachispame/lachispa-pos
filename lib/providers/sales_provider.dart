import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import '../core/database/database_helper.dart';
import '../models/sale.dart';
import '../models/sale_item.dart';
import '../models/cart_item.dart';

class SalesProvider extends ChangeNotifier {
  final _uuid = const Uuid();

  Future<String> createPendingSale({
    required String userId,
    required String userNombre,
    required List<CartItem> items,
    required double totalFiat,
    required String moneda,
    required int totalSats,
    required double rateUsado,
    required String invoiceId,
  }) async {
    final saleId = _uuid.v4();
    final now = DateTime.now();

    final db = await DatabaseHelper.instance.database;

    await db.insert('sales', {
      'id': saleId,
      'user_id': userId,
      'user_nombre': userNombre,
      'fecha': now.toIso8601String(),
      'total_fiat': totalFiat,
      'moneda': moneda,
      'total_sats': totalSats,
      'rate_usado': rateUsado,
      'invoice_id': invoiceId,
      'estado': 'pendiente',
    });

    for (final item in items) {
      await db.insert('sale_items', {
        'sale_id': saleId,
        'nombre': item.nombre,
        'precio_unitario': item.precioUnitario,
        'moneda': item.moneda,
        'cantidad': item.cantidad,
        'subtotal_fiat': item.subtotalFiat,
        'subtotal_sats': item.subtotalSats,
      });
    }

    notifyListeners();
    return saleId;
  }

  Future<void> saveSale({
    required String userId,
    required String userNombre,
    required List<CartItem> items,
    required double totalFiat,
    required String moneda,
    required int totalSats,
    required double rateUsado,
    String? invoiceId,
  }) async {
    final saleId = _uuid.v4();
    final now = DateTime.now();

    final db = await DatabaseHelper.instance.database;

    await db.insert('sales', {
      'id': saleId,
      'user_id': userId,
      'user_nombre': userNombre,
      'fecha': now.toIso8601String(),
      'total_fiat': totalFiat,
      'moneda': moneda,
      'total_sats': totalSats,
      'rate_usado': rateUsado,
      'invoice_id': invoiceId,
      'estado': 'completada',
    });

    for (final item in items) {
      await db.insert('sale_items', {
        'sale_id': saleId,
        'nombre': item.nombre,
        'precio_unitario': item.precioUnitario,
        'moneda': item.moneda,
        'cantidad': item.cantidad,
        'subtotal_fiat': item.subtotalFiat,
        'subtotal_sats': item.subtotalSats,
      });
    }

    notifyListeners();
  }

  Future<List<Sale>> getSalesByUser(String userId) async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.query(
      'sales',
      where: 'user_id = ?',
      whereArgs: [userId],
      orderBy: 'fecha DESC',
    );

    final sales = <Sale>[];
    for (final saleMap in result) {
      final items = await _getSaleItems(saleMap['id'] as String);
      sales.add(Sale.fromMap(saleMap, items));
    }

    return sales;
  }

  Future<List<Sale>> getAllUserSales(String userId) async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.query(
      'sales',
      where: 'user_id = ?',
      whereArgs: [userId],
      orderBy: 'fecha DESC',
    );

    final sales = <Sale>[];
    for (final saleMap in result) {
      final items = await _getSaleItems(saleMap['id'] as String);
      sales.add(Sale.fromMap(saleMap, items));
    }

    return sales;
  }

  Future<List<Sale>> getCompletedSales() async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.query(
      'sales',
      where: 'estado = ?',
      whereArgs: ['completada'],
      orderBy: 'fecha DESC',
    );

    final sales = <Sale>[];
    for (final saleMap in result) {
      final items = await _getSaleItems(saleMap['id'] as String);
      sales.add(Sale.fromMap(saleMap, items));
    }

    return sales;
  }

  Future<List<Sale>> getAllSales() async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.query('sales', orderBy: 'fecha DESC');

    final sales = <Sale>[];
    for (final saleMap in result) {
      final items = await _getSaleItems(saleMap['id'] as String);
      sales.add(Sale.fromMap(saleMap, items));
    }

    return sales;
  }

  Future<List<Sale>> getSalesGroupedByUser() async {
    return await getAllSales();
  }

  Future<Map<String, List<Sale>>> getSalesGroupedByDependiente() async {
    final sales = await getAllSales();
    final grouped = <String, List<Sale>>{};

    for (final sale in sales) {
      if (!grouped.containsKey(sale.userId)) {
        grouped[sale.userId] = [];
      }
      grouped[sale.userId]!.add(sale);
    }

    return grouped;
  }

  Future<List<SaleItem>> _getSaleItems(String saleId) async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.query(
      'sale_items',
      where: 'sale_id = ?',
      whereArgs: [saleId],
    );

    return result.map((m) => SaleItem.fromMap(m)).toList();
  }

  Future<Sale?> getSaleById(String id) async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.query('sales', where: 'id = ?', whereArgs: [id]);

    if (result.isEmpty) return null;

    final items = await _getSaleItems(id);
    return Sale.fromMap(result.first, items);
  }

  Future<int> getTotalSatsByUser(String userId) async {
    final sales = await getSalesByUser(userId);
    int total = 0;
    for (final sale in sales) {
      total += sale.totalSats;
    }
    return total;
  }

  Future<int> getSalesCountByUser(String userId) async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM sales WHERE user_id = ?',
      [userId],
    );
    return (result.first['count'] as int?) ?? 0;
  }

  Future<List<Sale>> getSalesForPeriod(DateTime start, DateTime end) async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.query(
      'sales',
      where: 'estado = ? AND fecha >= ? AND fecha <= ?',
      whereArgs: ['completada', start.toIso8601String(), end.toIso8601String()],
      orderBy: 'fecha DESC',
    );

    final sales = <Sale>[];
    for (final saleMap in result) {
      final items = await _getSaleItems(saleMap['id'] as String);
      sales.add(Sale.fromMap(saleMap, items));
    }
    return sales;
  }

  Future<Map<String, dynamic>> getTodayStats({String? userId}) async {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day);
    final end = start.add(const Duration(days: 1));

    final sales = await getSalesForPeriod(start, end);
    final filtered = userId == null
        ? sales
        : sales.where((s) => s.userId == userId).toList();

    return {
      'count': filtered.length,
      'totalSats':
          filtered.fold<int>(0, (sum, s) => sum + s.totalSats),
      'totalFiat': filtered.fold<double>(
        0.0,
        (sum, s) => sum + s.totalFiat,
      ),
    };
  }

  Future<Map<String, dynamic>> getWeekStats({String? userId}) async {
    final now = DateTime.now();
    final start = now.subtract(Duration(days: now.weekday - 1));
    final startDay = DateTime(start.year, start.month, start.day);
    final end = startDay.add(const Duration(days: 7));

    final sales = await getSalesForPeriod(startDay, end);
    final filtered = userId == null
        ? sales
        : sales.where((s) => s.userId == userId).toList();

    return {
      'count': filtered.length,
      'totalSats':
          filtered.fold<int>(0, (sum, s) => sum + s.totalSats),
      'totalFiat': filtered.fold<double>(
        0.0,
        (sum, s) => sum + s.totalFiat,
      ),
    };
  }

  Future<Map<String, dynamic>> getMonthStats({String? userId}) async {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, 1);
    final end = DateTime(now.year, now.month + 1, 1);

    final sales = await getSalesForPeriod(start, end);
    final filtered = userId == null
        ? sales
        : sales.where((s) => s.userId == userId).toList();

    return {
      'count': filtered.length,
      'totalSats':
          filtered.fold<int>(0, (sum, s) => sum + s.totalSats),
      'totalFiat': filtered.fold<double>(
        0.0,
        (sum, s) => sum + s.totalFiat,
      ),
    };
  }

  Future<List<Map<String, dynamic>>> getSalesPerDay(int days) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final result = <Map<String, dynamic>>[];

    for (int i = days - 1; i >= 0; i--) {
      final day = today.subtract(Duration(days: i));
      final nextDay = day.add(const Duration(days: 1));
      final daySales = await getSalesForPeriod(day, nextDay);
      final totalSats = daySales.fold<int>(0, (sum, s) => sum + s.totalSats);

      result.add({
        'date': day,
        'totalSats': totalSats,
        'count': daySales.length,
      });
    }

    return result;
  }

  Future<List<Map<String, dynamic>>> getTopProducts({int limit = 5}) async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.rawQuery('''
      SELECT nombre, SUM(cantidad) as total_qty,
             SUM(subtotal_sats) as total_sats
      FROM sale_items
      WHERE sale_id IN (
        SELECT id FROM sales WHERE estado = 'completada'
      )
      GROUP BY nombre
      ORDER BY total_qty DESC
      LIMIT ?
    ''', [limit]);

    return result.map((r) => {
      'nombre': r['nombre'] as String,
      'cantidad': (r['total_qty'] as num).toInt(),
      'totalSats': (r['total_sats'] as num).toInt(),
    }).toList();
  }

  Future<List<Map<String, dynamic>>> getEmployeeSummary() async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.rawQuery('''
      SELECT user_id, user_nombre,
             COUNT(*) as count,
             SUM(total_sats) as total_sats
      FROM sales
      WHERE estado = 'completada'
      GROUP BY user_id
      ORDER BY total_sats DESC
    ''');

    return result.map((r) => {
      'userId': r['user_id'] as String,
      'userNombre': r['user_nombre'] as String,
      'count': (r['count'] as num).toInt(),
      'totalSats': (r['total_sats'] as num).toInt(),
    }).toList();
  }

  Future<void> deleteSale(String id) async {
    final db = await DatabaseHelper.instance.database;
    await db.delete('sale_items', where: 'sale_id = ?', whereArgs: [id]);
    await db.delete('sales', where: 'id = ?', whereArgs: [id]);
    notifyListeners();
  }

  Future<void> markSaleAsCompleted(String saleId) async {
    final db = await DatabaseHelper.instance.database;
    await db.update(
      'sales',
      {'estado': 'completada'},
      where: 'id = ?',
      whereArgs: [saleId],
    );
    notifyListeners();
  }

  Future<List<Sale>> getPendingSales(String userId) async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.query(
      'sales',
      where: 'user_id = ? AND estado = ?',
      whereArgs: [userId, 'pendiente'],
      orderBy: 'fecha DESC',
    );

    final sales = <Sale>[];
    for (final saleMap in result) {
      final items = await _getSaleItems(saleMap['id'] as String);
      sales.add(Sale.fromMap(saleMap, items));
    }

    return sales;
  }

  Future<void> deleteAllSalesByUser(String userId) async {
    final db = await DatabaseHelper.instance.database;

    final sales = await db.query(
      'sales',
      columns: ['id'],
      where: 'user_id = ?',
      whereArgs: [userId],
    );

    for (final sale in sales) {
      await db.delete(
        'sale_items',
        where: 'sale_id = ?',
        whereArgs: [sale['id']],
      );
    }

    await db.delete('sales', where: 'user_id = ?', whereArgs: [userId]);

    notifyListeners();
  }

  Future<void> deletePendingSales(String userId) async {
    final db = await DatabaseHelper.instance.database;

    final sales = await db.query(
      'sales',
      columns: ['id'],
      where: 'user_id = ? AND estado = ?',
      whereArgs: [userId, 'pendiente'],
    );

    for (final sale in sales) {
      await db.delete(
        'sale_items',
        where: 'sale_id = ?',
        whereArgs: [sale['id']],
      );
    }

    await db.delete(
      'sales',
      where: 'user_id = ? AND estado = ?',
      whereArgs: [userId, 'pendiente'],
    );

    notifyListeners();
  }

  Future<void> deleteAllImportedSales() async {
    final db = await DatabaseHelper.instance.database;

    final sales = await db.query(
      'sales',
      columns: ['id'],
      where: 'exported_at IS NOT NULL AND exported_at != ""',
    );

    print('Eliminando ${sales.length} ventas importadas');

    for (final sale in sales) {
      await db.delete(
        'sale_items',
        where: 'sale_id = ?',
        whereArgs: [sale['id']],
      );
    }

    await db.delete(
      'sales',
      where: 'exported_at IS NOT NULL AND exported_at != ""',
    );

    notifyListeners();
  }
}
