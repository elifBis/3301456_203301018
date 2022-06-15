
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../database/word.dart';

class DbUtils {

  static final DbUtils _dbUtils = DbUtils._internal();

  DbUtils._internal();

  factory DbUtils() {
    return _dbUtils;
  }

  static Database? _db;

  Future<Database?> get db async {
    _db ??= await initializeDb();
    return _db;
  }

  Future<Database> initializeDb() async {
    String path = join(await getDatabasesPath(), 'words_database.db');
    var dbWords = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbWords;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE words(id INTEGER PRIMARY KEY, word TEXT, correspond TEXT, country TEXT)");
  }

  Future<void> deleteTable() async {
    final Database? db = await this.db;
    db?.delete('words');
  }

  Future<void> insertWord(Word word) async {
    final Database? db = await this.db;
    await db?.insert(
      'words',
      word.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  Future<List<Word>> words() async {
    final Database? db = await this.db;
    final List<Map<String, Object?>>? maps = await db?.query('words');

    return List.generate(maps!.length, (i) {
      return Word(
        id: int.parse(maps[i]['id'].toString()),
        word: maps[i]['word'].toString(),
        correspond: maps[i]['correspond'].toString(),
        country:maps[i]['country'].toString()
      );
    });
  }

  Future<void> updateWord(Word word) async {
    final db = await this.db;
    await db?.update(
      'word',
      word.toMap(),
      where: "id = ?",
      whereArgs: [word.id],
    );
  }

  Future<void> deleteWord(int id) async {
    final db = await this.db;
    await db?.delete(
      'word',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}