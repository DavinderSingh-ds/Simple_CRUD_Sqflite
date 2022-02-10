import 'dart:io';

import 'package:crud_database/Model/model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseProvider {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'category';
  static final columnId = 'id';
  static final columnName = 'categoryname';
  static final columnColor = 'dogcolor';

  // make this a singleton class
  DatabaseProvider._privateConstructor();
  static final DatabaseProvider instance =
      DatabaseProvider._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    // lazily instantiate the db the first time it is accessed

    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $table ("
        "$columnId INTEGER PRIMARY KEY AUTOINCREMENT,"
        "$columnName TEXT,"
        "$columnColor TEXT,"
        ")");
  }

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  addCategory(CategoryModel categoryModel) async {
    Database db = await instance.database;
    return await db.insert('$table', categoryModel.toDatabaseJson());
  }

  //Getting data from the Category Table to show in the page
  Future<List<CategoryModel>> retriveCategories() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> categoryData = await db.query('$table');
    return categoryData.map((e) => CategoryModel.fromDatabaseJson(e)).toList();
  }

  // //Deleting the entry from the database
  // Future<void> deleteCategory(int? id) async {
  //   final db = await instance.database;
  //   await db.delete(
  //     '$table',
  //     where: "id = ?",
  //     whereArgs: [id],
  //   );
  // }

  // //Update the entry by Id
  // updateData(CategoryModel categoryModel) async {
  //   final db = await database;
  //   var result = await db.update("$table", categoryModel.toDatabaseJson(),
  //       where: "id = ?", whereArgs: [categoryModel.id]);
  //   return result;
  // }
}
