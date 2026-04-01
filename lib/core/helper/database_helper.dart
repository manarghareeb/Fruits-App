import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteService {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initializeDb();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> initializeDb() async {
    String path = join(await getDatabasesPath(), 'cart.db');
    Database mydb = await openDatabase(
      path, 
      onCreate: _onCreate, 
      onUpgrade: _onUpgrade, 
      version: 4
    );
    return mydb;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE "cart" (
        "id" INTEGER PRIMARY KEY,
        "name" TEXT, "name_en" TEXT, "img" TEXT,
        "price" REAL, "discount" REAL, "quantity" INTEGER,
        "unit" TEXT, "unit_en" TEXT, "details" TEXT,
        "details_en" TEXT, "vendor_id" INTEGER,
        "category_id" INTEGER, "name_category" TEXT,
        "name_category_en" TEXT, "is_favorite" INTEGER,
        "cart_quantity" INTEGER
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 3) {
    try {
      await db.execute('ALTER TABLE cart ADD COLUMN cart_quantity INTEGER DEFAULT 1');
    } catch (e) {
      log("Column might already exist: $e");
    }
  }
  }

  Future<int> insertProduct(Map<String, dynamic> data) async {
    Database? mydb = await db;
    return await mydb!.insert(
      'cart',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getAllCartProducts() async {
    Database? mydb = await db;
    return await mydb!.query('cart');
  }

  Future<Map<String, dynamic>?> getProductById(int id) async {
    Database? mydb = await db;
    List<Map<String, dynamic>> results = await mydb!.query(
      'cart',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }

  Future<int> deleteProduct(int id) async {
    Database? mydb = await db;
    return await mydb!.delete('cart', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateProductQuantity(int id, int newQuantity) async {
    Database? mydb = await db;
    return await mydb!.update(
      'cart',
      {'cart_quantity': newQuantity},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
