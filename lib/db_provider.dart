import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'meigen.dart';

class DBProvider {
  static Future<sql.Database> createDB() async {
    // initialize the database
    return sql.openDatabase(
      'meigen.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // initialize the table
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE meigen(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        meigen TEXT,
        author TEXT,
        category TEXT
     )
      """);
    await database.execute("""
        INSERT INTO table_name (meigen, author, category) VALUES ("happy wife", "keita", "marrige";
      """);
  }

  static Future<List<Map<String, dynamic>>> getMeigens() async {
    // dbをインスタンス化
    final db = await DBProvider.createDB();
    return db.query('meigen', orderBy: "id");
  }

 
}