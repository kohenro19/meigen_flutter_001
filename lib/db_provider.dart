import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'note.dart';

class DBProvider {
  final _databaseName = "MyDatabase.db";
  final _databaseVersion = 1;
  final dbpath = getDatabasesPath();
  
  // make this singleton class
  static final DBProvider _instance = DBProvider._();
  factory DBProvider() {
    return _instance;
  }
  DBProvider._();
  late Database? _database;
  Future<Database> get database async {
    _database = await _initDatabase();
    return _database!;
  }

  void _createTableV1(Batch batch) {
    batch.execute('''
    CREATE TABLE meigen(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      weatherCode INTEGER,
      emotion INTEGER,
      createdDate TEXT 
    ) ''');
  }

  //this opens the database (and creates it if it doesn't exist)
  Future<Database> _initDatabase() async {
    final Directory documentsDirectory =
        await getApplicationDocumentsDirectory();
    final String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) async {
        await db.execute('''
            CREATE TABLE note(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              title TEXT,
              weatherCode INTEGER,
              emotion INTEGER,
              createdDate TEXT 
            ) '''         
        );
      },
      onDowngrade: onDatabaseDowngradeDelete,
    );
  }

  // function to add data into the database.
  Future<void> insertNote(Note note) async {
    final db = await database;
    await db.insert(
      'note',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // function to delete data form the database.
  Future<int> deleteNote(Note note) async {
    final db = await database;
    int result = await db.delete(
      'note',
      where: 'id == ?',
      whereArgs: [note.id],
    );
    return result;
  }

  Future<List<Note>> getNote() async {
    final db = await database;
    
    List<Map<String, dynamic>> items = await db.query(
      'note',
       orderBy: 'id DESC',
       
    );

    return List.generate(
      items.length,
      (i) => Note(
        id: items[i]['id'],
        title: items[i]['title'],
        weatherCode: items[i]['weatherCode'],
        emotion: items[i]['emotion'],
        createdDate: DateTime.parse(items[i]['createdDate']), // convert from String type into DateTime type
      ),

    );
  }

  Future<Map<DateTime, List<String>>> getdayEventsMap() async {
    var dayEventsMap = <DateTime, List<String>>{};

    List<String> eventslist = [];
    final db = await database; 
    
    // データベースからMapのデータを取得
    List<Map> result = await db.rawQuery('SELECT * FROM note');

    for (var line in result) {

      // item['createdDate']をString型からDateTime型に変更
      DateTime eventDate = DateTime.parse(line['createdDate']);

      // !よりif文でnullチェックするほうが安全。

      // 重複するkeyが含まれているか確認する
      if (dayEventsMap.containsKey(eventDate)) {
        
        // 重複するkeyの値dayEventsMap['$eventDate']をeventlistに代入する
        // !は、nullじゃないと宣言する記号
        eventslist = dayEventsMap[eventDate]!;

        // eventlistに追加分line['title']を追記する
        eventslist.add(line['title']);
       
       // 重複するkeyの値をを更新する
        dayEventsMap[eventDate] = eventslist;

      } else {
        List<String> eventslist = []; // 初期化
        eventslist.add(line['title']);
        dayEventsMap[eventDate] = eventslist;
      }
    }
    return dayEventsMap;

  }

  Future<Map> getWeatherCode(createdDate, event) async {
    // 後ろのZを削除
    createdDate = await createdDate.replaceAll("Z", "");
    final db = await database;
    
    List<Map> result = await db.rawQuery("SELECT * FROM note where createdDate = '$createdDate' and title = '$event'");

    // 先頭行のみ抽出  
    return result[0];

  }
  

}

  // function to fetch all the note date from the database