import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static Database? _db;

  static Future<void> initDb() async {
    if (_db != null) return;
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'bookmarks.db');
    _db = await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE bookmarks (
          id INTEGER PRIMARY KEY,
          title TEXT,
          price REAL,
          description TEXT,
          category TEXT,
          image TEXT
        )
      ''');
    });
  }

  static Future<int> insertBookmark(Map<String, dynamic> item) async {
    return await _db!.insert('bookmarks', item, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getBookmarks() async {
    return await _db!.query('bookmarks');
  }

  static Future<int> removeBookmark(int id) async {
    return await _db!.delete('bookmarks', where: 'id = ?', whereArgs: [id]);
  }

  static Future<bool> isBookmarked(int id) async {
    final res = await _db!.query('bookmarks', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty;
  }
}

