import 'package:sqflite/sqflite.dart';

import 'tables/wiki_table.dart';

class DbConfig {
  static Database _db;

  static Future<Database> getInstance() async {
    if (_db == null) {
      _db = await openDatabase('wiki_db.db', version: 1,
          onCreate: (Database db, int version) async {
                    await db.execute(WikiTable.drop());

        await db.execute(WikiTable.create());
      });
    }
    return _db;
  }

  static close() async {
    await _db.close();
  }

  static deleteDB() async {
    await deleteDatabase(_db.path);
  }
}
