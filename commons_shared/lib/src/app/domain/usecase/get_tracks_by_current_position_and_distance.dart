import '../entities/coordinate_entity.dart';
import '../entities/track_entity.dart';

abstract class GetTracksByCurrentPositionAndDistanceUsecase {
  Future<List<TrackEntity>> call(
      CoordinateEntity coordinateEntity, int radiusDistance);
}
