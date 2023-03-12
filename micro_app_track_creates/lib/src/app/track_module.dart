import 'package:commons_dependencies/main.dart';
import 'package:commons_shared/main.dart';
import 'package:micro_app_map_tracks/main.dart';

import 'track_controller.dart';
import 'track_page.dart';

class TrackModule extends Module {
  static const String mapTracksRoute = "/map/";

  @override
  List<Bind> get binds => [
        $TrackRepositoryImpl,
        $PublishTrackUsecaseImpl,
        $TrackController,
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => TrackPage(),
        ),
        ModuleRoute(
          mapTracksRoute,
          module: MapModule(),
        )
      ];
}
