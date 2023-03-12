import 'package:commons_dependencies/main.dart';

import '../../main.dart';

class CommonsSharedModule extends Module {
  @override
  List<Bind> get binds => [
        $HttpClient,
        $DatabaseProvider,
        $TrackDatabaseRepository,
        $TrackRepositoryImpl,
        $PublishTrackUsecaseImpl,
        $GetTracksByCurrentPositionAndDistanceUsecaseImpl,
      ];

  @override
  List<ModularRoute> get routes => [];
}
