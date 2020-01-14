import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:anxiety_tracker/models/entry.dart';

class DatabaseHelper {
  static final _databaseName = "gad7.db";
  static final _databaseVersion = 1;

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only have a single app-wide reference to the database.
  static Database _database;

  // Lazily instantiate the db the first time it is accessed.
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // This opens the database (and creates it if it doesn't exist).
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL code to create the database table.
  Future _onCreate(Database db, int version) async {
    await db.execute(Entry.createTable);
  }

  // Inserts a row into the database.
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('entries', row);
  }

  // Queries all entries.
  Future<List<Entry>> query() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.query('entries');
    List<Entry> entries = [];
    result.forEach((row) {
      entries.add(Entry.fromMap(row));
    });
    return entries;
  }
}
