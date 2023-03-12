import 'dart:io';

import 'package:commons_dependencies/main.dart';
import 'package:path/path.dart';

import '../utils/tables.dart';

final $DatabaseProvider = Bind.lazySingleton(
  (i) => DatabaseProvider(),
  export: true,
);

class DatabaseProvider {
  late final Future<Database> _database;

  DatabaseProvider() {
    _database = _createDatabase();
  }

  Future<Database> get database => _database;

  Future<Database> _createDatabase() async {
    final Directory documentsDirectory =
        await getApplicationDocumentsDirectory();

    final String path = join(documentsDirectory.path, "tb.db");

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE ${Tables.tableCoordinates} ("
          "id INTEGER PRIMARY KEY,"
          "trackId INTEGER,"
          "latitude REAL,"
          "longitude REAL"
          ")");

      await db.execute("CREATE TABLE ${Tables.tableTracks} ("
          "localId INTEGER PRIMARY KEY,"
          "startSpeed INTEGER,"
          "maxSpeed INTEGER,"
          "distance REAL,"
          "time INTEGER,"
          "userId TEXT,"
          "checkSum TEXT"
          ")");
    });
  }
}
