import 'package:uuid/uuid.dart';

class Product {
  final String id;
  final String nombre;
  final double precio;
  final String moneda;
  final String? categoria;
  final DateTime createdAt;

  Product({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.moneda,
    this.categoria,
    required this.createdAt,
  });

  factory Product.create({
    required String nombre,
    required double precio,
    required String moneda,
    String? categoria,
  }) {
    return Product(
      id: const Uuid().v4(),
      nombre: nombre,
      precio: precio,
      moneda: moneda,
      categoria: categoria,
      createdAt: DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'precio': precio,
      'moneda': moneda,
      'categoria': categoria,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      nombre: map['nombre'] as String,
      precio: (map['precio'] as num).toDouble(),
      moneda: map['moneda'] as String,
      categoria: map['categoria'] as String?,
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }

  Product copyWith({
    String? id,
    String? nombre,
    double? precio,
    String? moneda,
    String? categoria,
    DateTime? createdAt,
  }) {
    return Product(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      precio: precio ?? this.precio,
      moneda: moneda ?? this.moneda,
      categoria: categoria ?? this.categoria,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
