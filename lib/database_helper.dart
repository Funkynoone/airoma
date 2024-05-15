import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'models.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'airoma.db');
    return openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE materials(
        id INTEGER PRIMARY KEY,
        name TEXT,
        category TEXT,
        tenacity TEXT,
        noteType TEXT,
        scentType TEXT,
        dilution REAL
      )
    ''');

    await db.execute('''
      CREATE TABLE formulas(
        id INTEGER PRIMARY KEY,
        name TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE formula_materials(
        id INTEGER PRIMARY KEY,
        formula_id INTEGER,
        material_id INTEGER,
        grams REAL,
        FOREIGN KEY (formula_id) REFERENCES formulas(id),
        FOREIGN KEY (material_id) REFERENCES materials(id)
      )
    ''');
  }

// Implement CRUD methods for materials and formulas
}
