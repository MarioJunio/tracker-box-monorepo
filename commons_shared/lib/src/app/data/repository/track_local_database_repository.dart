import 'package:commons_dependencies/main.dart';

import '../../database/database.dart';
import '../../domain/entities/coordinate_entity.dart';
import '../../domain/entities/track_entity.dart';
import '../../utils/tables.dart';

final $TrackDatabaseRepository = Bind.lazySingleton(
  (i) => TrackLocalDatabaseRepository(i()),
  export: true,
);

class TrackLocalDatabaseRepository {
  late final DatabaseProvider databaseProvider;
  late final String tableName;

  TrackLocalDatabaseRepository(this.databaseProvider) {
    tableName = Tables.tableTracks;
  }

  Future<int> getNextTrackId() async {
    final table = await (await databaseProvider.database)
        .rawQuery("SELECT MAX(localId) + 1 AS localId FROM $tableName");
    return (table.first['localId'] ?? 1) as int;
  }

  Future<int> getNextCoordinateId() async {
    final table = await (await databaseProvider.database)
        .rawQuery("SELECT MAX(id) + 1 AS id FROM ${Tables.tableCoordinates}");
    return (table.first['id'] ?? 1) as int;
  }

  save(TrackEntity trackEntity) async {
    // get new id for track
    trackEntity = trackEntity.copyWith(localId: await getNextTrackId());

    // persit track
    final int trackId = await (await databaseProvider.database)
        .insert(tableName, trackEntity.toLocalDatabaseMap());

    // persist coordinates
    for (final coordinate in trackEntity.coordinates!) {
      final coordinateId = await getNextCoordinateId();

      (await databaseProvider.database).insert(Tables.tableCoordinates,
          coordinate.toLocalDatabaseMap(coordinateId, trackId));
    }
  }

  Future<List<TrackEntity>> getAll({String? userId}) async {
    final List<Map<String, Object?>> result =
        await (await databaseProvider.database).query(
      tableName,
      where: _createWhere(userId),
      whereArgs: _createWhereArgs(userId),
    );

    final List<TrackEntity> tracks = [];

    for (var trackMap in result) {
      final track = TrackEntity.fromLocalDatabaseMap(trackMap);
      final coordinates = await _getCoordinatesByTrack(track.localId!);

      tracks.add(track.copyWith(coordinates: coordinates));
    }

    return tracks;
  }

  delete(int localId) async {
    await (await databaseProvider.database).delete(
      Tables.tableCoordinates,
      where: "trackId = ?",
      whereArgs: [localId],
    );

    return await (await databaseProvider.database).delete(
      tableName,
      where: "localId = ?",
      whereArgs: [localId],
    );
  }

  String _createWhere(String? userId) {
    var result = '';

    if (userId != null && userId.isNotEmpty) {
      result = 'userId = ?';
    }

    return result;
  }

  List<String?>? _createWhereArgs(String? userId) {
    List<String?>? result;

    if (userId != null && userId.isNotEmpty) {
      result = [userId];
    }

    return result;
  }

  Future<List<CoordinateEntity>> _getCoordinatesByTrack(int trackId) async {
    final List<Map<String, Object?>> result =
        await (await databaseProvider.database).query(
      Tables.tableCoordinates,
      where: 'trackId = ?',
      whereArgs: [trackId],
    );

    return result.map((e) => CoordinateEntity.fromMap(e)).toList();
  }
}
