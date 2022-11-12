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
        category TEXT);
      """);
    await database.execute("""
        INSERT INTO meigen(meigen, author, category) VALUES ("happy wife2", "keita2", "marrige2");
        INSERT INTO meigen(meigen, author, category)  VALUES ("happy wife", "keita", "human relationship");
      """);
  }

  Future<List<Meigen>> getMeigens() async {
    // dbをインスタンス化
    final db = await DBProvider.createDB();
    List<Map<String, dynamic>> items = await db.query('meigen', orderBy: "id");
  
    return List.generate(
      items.length,
      (i) => Meigen(
        id: items[i]['id'],
        meigen: items[i]['meigen'],
        author: items[i]['author'],
      ),

    );
  }
}