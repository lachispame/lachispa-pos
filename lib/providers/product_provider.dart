import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../core/database/database_helper.dart';
import '../models/product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  bool _loading = false;

  List<Product> get products => List.unmodifiable(_products);
  bool get loading => _loading;

  Future<void> loadProducts() async {
    _loading = true;
    notifyListeners();

    try {
      final db = await DatabaseHelper.instance.database;
      final result = await db.query(
        'products',
        orderBy: 'nombre ASC',
      );
      _products = result.map((m) => Product.fromMap(m)).toList();
    } catch (e) {
      debugPrint('ProductProvider: error loading products: $e');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> addProduct({
    required String nombre,
    required double precio,
    required String moneda,
    String? categoria,
    int? stock,
  }) async {
    final product = Product.create(
      nombre: nombre,
      precio: precio,
      moneda: moneda,
      categoria: categoria,
      stock: stock,
    );

    final db = await DatabaseHelper.instance.database;
    await db.insert('products', product.toMap());

    _products.add(product);
    notifyListeners();
  }

  Future<void> updateProduct(Product product) async {
    final db = await DatabaseHelper.instance.database;
    await db.update(
      'products',
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.id],
    );

    final index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index] = product;
      notifyListeners();
    }
  }

  Future<void> deleteProduct(String id) async {
    final db = await DatabaseHelper.instance.database;
    await db.delete('products', where: 'id = ?', whereArgs: [id]);

    _products.removeWhere((p) => p.id == id);
    notifyListeners();
  }

  List<Product> searchProducts(String query) {
    if (query.isEmpty) return _products;
    final q = query.toLowerCase();
    return _products
        .where((p) => p.nombre.toLowerCase().contains(q))
        .toList();
  }

  Future<void> decrementStockByName(String nombre, int cantidad) async {
    final index = _products.indexWhere(
      (p) => p.nombre == nombre && p.stock != null,
    );
    if (index == -1) return;

    final product = _products[index];
    final newStock = (product.stock! - cantidad).clamp(0, product.stock!);
    final updated = product.copyWith(stock: newStock);

    final db = await DatabaseHelper.instance.database;
    await db.update(
      'products',
      {'stock': newStock},
      where: 'id = ?',
      whereArgs: [product.id],
    );

    _products[index] = updated;
    notifyListeners();
  }

  Future<void> exportCatalog() async {
    final json = const JsonEncoder.withIndent('  ').convert(
      _products.map((p) => {
        'nombre': p.nombre,
        'precio': p.precio,
        'moneda': p.moneda,
        'categoria': p.categoria,
        if (p.stock != null) 'stock': p.stock,
      }).toList(),
    );

    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/catalogo_productos.json');
    await file.writeAsString(json);

    await Share.shareXFiles(
      [XFile(file.path)],
      text: 'Catálogo de productos LaChispaPOS',
    );
  }

  Future<int> importCatalogFromJson(Map<String, dynamic> data) async {
    final productos = data['productos'] as List<dynamic>?;
    if (productos == null) return 0;

    int imported = 0;
    for (final p in productos) {
      final nombre = p['nombre'] as String?;
      final precio = (p['precio'] as num?)?.toDouble();
      final moneda = p['moneda'] as String? ?? 'USD';
      if (nombre == null || nombre.isEmpty || precio == null || !precio.isFinite || precio <= 0) {
        continue;
      }

      final exists = _products.any(
        (pp) => pp.nombre.toLowerCase() == nombre.toLowerCase(),
      );
      if (exists) continue;

      await addProduct(
        nombre: nombre,
        precio: precio,
        moneda: moneda,
        categoria: p['categoria'] as String?,
        stock: (p['stock'] as num?)?.toInt(),
      );
      imported++;
    }

    return imported;
  }

  Future<Map<String, dynamic>?> pickCatalogJson() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );
    if (result == null || result.files.isEmpty) return null;

    final path = result.files.first.path;
    if (path == null) return null;

    final file = File(path);
    try {
      return json.decode(await file.readAsString()) as Map<String, dynamic>;
    } catch (_) {
      return null;
    }
  }
}
