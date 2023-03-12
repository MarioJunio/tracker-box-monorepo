import 'package:commons_dependencies/main.dart';
import 'package:commons_shared/main.dart';

final $TrackRepositoryImpl = Bind.lazySingleton(
  (i) => TrackRepositoryImpl(
    i.get(),
  ),
  export: true,
);

class TrackRepositoryImpl implements TrackRepository {
  final HttpClient httpClient;

  TrackRepositoryImpl(this.httpClient);

  @override
  Future<TrackEntity> publish(TrackEntity track) async {
    final response = await httpClient.post('/tracks', data: track.toJson());

    if (response.statusCode == 201) {
      return TrackEntity.fromMap(response.data);
    }

    throw PublishTrackException(response.data);
  }

  @override
  Future<List<TrackEntity>> filterByPosition(
      CoordinateEntity coordinate, int radiusDistance) async {
    final response =
        await httpClient.get('/tracks/by-distance', queryParameters: {
      'currentCoordinate.latitude': coordinate.latitude,
      'currentCoordinate.longitude': coordinate.longitude,
      'maxDistance': radiusDistance,
    });

    if (response.statusCode == 200) {
      return (response.data as List)
          .map((track) => TrackEntity.fromMap(track))
          .toList();
    }

    return Future.value([]);
  }
}
