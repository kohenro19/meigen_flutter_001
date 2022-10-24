import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'meigen.dart';

class DBProvider {
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'meigen.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE meigen(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        meigen TEXT,
        author TEXT,
     )
      """);
  }

 
}