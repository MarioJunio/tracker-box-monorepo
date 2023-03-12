import '../entities/track_entity.dart';

abstract class PublishTrackUsecase {
  Future<TrackEntity> call(TrackEntity track);
}
