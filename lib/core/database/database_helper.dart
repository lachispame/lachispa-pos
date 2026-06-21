import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../constants/app_constants.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, AppConstants.dbName);

    return await openDatabase(
      path,
      version: AppConstants.dbVersion,
      onCreate: _createDB,
      onUpgrade: _upgradeDB,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
    );
  }

  Future<void> _upgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
        CREATE TABLE IF NOT EXISTS products (
          id TEXT PRIMARY KEY,
          nombre TEXT NOT NULL,
          precio REAL NOT NULL,
          moneda TEXT NOT NULL DEFAULT 'USD',
          categoria TEXT,
          created_at TEXT NOT NULL
        )
      ''');
    }
    if (oldVersion < 3) {
      await db.execute('''
        ALTER TABLE products ADD COLUMN stock INTEGER
      ''');
    }
    if (oldVersion < 4) {
      await db.execute('''
        ALTER TABLE sales ADD COLUMN table_id TEXT
      ''');
    }
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id TEXT PRIMARY KEY,
        nombre TEXT NOT NULL,
        rol TEXT NOT NULL CHECK(rol IN ('jefe', 'dependiente')),
        lndhub_url TEXT,
        lndhub_creds TEXT,
        created_at TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE sales (
        id TEXT PRIMARY KEY,
        user_id TEXT NOT NULL,
        user_nombre TEXT NOT NULL,
        fecha TEXT NOT NULL,
        total_fiat REAL NOT NULL,
        moneda TEXT NOT NULL,
        total_sats INTEGER NOT NULL,
        rate_usado REAL NOT NULL,
        invoice_id TEXT,
        estado TEXT NOT NULL DEFAULT 'completada',
        exported_at TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE sale_items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        sale_id TEXT NOT NULL,
        nombre TEXT NOT NULL,
        precio_unitario REAL NOT NULL,
        moneda TEXT NOT NULL,
        cantidad INTEGER NOT NULL,
        subtotal_fiat REAL NOT NULL,
        subtotal_sats INTEGER NOT NULL,
        FOREIGN KEY (sale_id) REFERENCES sales(id) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE cart_temp (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        session_id TEXT NOT NULL,
        nombre TEXT NOT NULL,
        precio_unitario REAL NOT NULL,
        moneda TEXT NOT NULL,
        cantidad INTEGER NOT NULL,
        subtotal_fiat REAL NOT NULL,
        subtotal_sats INTEGER NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE products (
        id TEXT PRIMARY KEY,
        nombre TEXT NOT NULL,
        precio REAL NOT NULL,
        moneda TEXT NOT NULL DEFAULT 'USD',
        categoria TEXT,
        stock INTEGER,
        created_at TEXT NOT NULL
      )
    ''');
  }

  Future<void> close() async {
    final db = await instance.database;
    db.close();
  }
}
