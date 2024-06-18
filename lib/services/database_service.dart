import 'package:finance_app/models/category.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance =
      DatabaseService._constructor(); //Singleton Pattern

  final String _categoryTableName = "category";
  final String _categoryColumnId = "id";
  final String _categoryColumnTypeId = "typeId";
  final String _categoryColumnName = "name";
  final String _categoryColumnNotes = "notes";

  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "master_db.db");
    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
           CREATE TABLE $_categoryTableName (
             $_categoryColumnId INTEGER PRIMARY KEY,
             $_categoryColumnTypeId INTEGER,
             $_categoryColumnName TEXT NOT NULL,
             $_categoryColumnNotes TEXT NOT NULL
           )
        
        ''');
      },
    );

    return database;
  }

  void addCategory(String contentName, String contentNotes) async {
    final db = await database;
    await db.insert(_categoryTableName, {
      _categoryColumnName: contentName,
      _categoryColumnNotes: contentNotes,
      _categoryColumnTypeId: 0,
    });
  }

  Future<List<Category>?> getCategories() async {
    final db = await database;
    final data = await db.query(_categoryTableName);

    List<Category> categories = data
        .map(
          (e) => Category(
            id: e["id"] as int,
            typeId: e["typeId"] as int,
            name: e["name"] as String,
            notes: e["notes"] as String,
          ),
        )
        .toList();

    return categories;
  }

  void updateCategoryTypeId(int id, int typeId) async {
    final db = await database;
    await db.update(
        _categoryTableName,
        {
          _categoryColumnTypeId: typeId,
        },
        where: 'id = ?',
        whereArgs: [
          id,
        ]);
  }

  void deleteCategory(int id) async {
    final db = await database;
    await db.delete(_categoryTableName, where: 'id = ?', whereArgs: [
      id,
    ]);
  }
}
