import 'dart:async';

import 'package:finance_app/model/category.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'finance_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE category(id INTEGER PRIMARY KEY, typeId TEXT, name TEXT, notes TEXT)',
      );
    },
    version: 1,
  );

  Future<void> insertCategory(Category category) async {
    final db = await database;

    await db.insert(
      'category',
      category.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Category>> listCategory() async {
    final db = await database;

    final List<Map<String, Object?>> categoryMaps = await db.query('category');

    return [
      for (final {
            'id': id as int,
            'typeId': typeId as int,
            'name': name as String,
            'notes': notes as String,
          } in categoryMaps)
        Category(id: id, typeId: typeId, name: name, notes: notes),
    ];
  }

  Future<void> updateCategory(Category category) async {
    final db = await database;

    await db.update(
      'category',
      category.toMap(),
      where: 'id = ?',
      whereArgs: [category.id],
    );
  }

  Future<void> deleteCategory(int id) async {
    final db = await database;

    await db.delete(
      'category',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  var cate = const Category(
    id: 0,
    typeId: 1,
    name: 'Essentials',
    notes: 'Test fields',
  );

  await insertCategory(cate);

  print(await listCategory());
}
