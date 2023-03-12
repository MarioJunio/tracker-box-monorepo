import 'package:commons_dependencies/main.dart';

import '../../entities/track_entity.dart';
import '../../repository/track_repository.dart';
import '../publish_track_usecase.dart';

final $PublishTrackUsecaseImpl = Bind.lazySingleton(
  (i) => PublishTrackUsecaseImpl(
    i(),
  ),
  export: true,
);

class PublishTrackUsecaseImpl implements PublishTrackUsecase {
  final TrackRepository _trackRepository;

  PublishTrackUsecaseImpl(this._trackRepository);

  @override
  Future<TrackEntity> call(TrackEntity track) async {
    return await _trackRepository.publish(track);
  }
}
