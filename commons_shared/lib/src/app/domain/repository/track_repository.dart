import 'package:commons_shared/main.dart';

abstract class TrackRepository {
  Future<TrackEntity> publish(TrackEntity track);

  Future<List<TrackEntity>> filterByPosition(
      CoordinateEntity coordinate, int radiusDistance);
}
