import 'package:commons_dependencies/main.dart';

import '../../entities/coordinate_entity.dart';
import '../../entities/track_entity.dart';
import '../../repository/track_repository.dart';
import '../get_tracks_by_current_position_and_distance.dart';

final $GetTracksByCurrentPositionAndDistanceUsecaseImpl = Bind.lazySingleton(
  (i) => GetTracksByCurrentPositionAndDistanceUsecaseImpl(
    i(),
  ),
  export: true,
);

class GetTracksByCurrentPositionAndDistanceUsecaseImpl
    implements GetTracksByCurrentPositionAndDistanceUsecase {
  final TrackRepository _trackRepository;

  GetTracksByCurrentPositionAndDistanceUsecaseImpl(this._trackRepository);

  @override
  Future<List<TrackEntity>> call(
      CoordinateEntity coordinate, int radiusDistance) async {
    return await _trackRepository.filterByPosition(coordinate, radiusDistance);
  }
}
