import 'package:commons_shared/main.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:micro_app_auth/main.dart';
import 'package:micro_app_map_tracks/main.dart';
import 'package:micro_app_track_creates/main.dart';

import 'app_controller.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CommonsSharedModule(),
        AuthModule(),
        TrackModule(),
        MapModule(),
      ];

  @override
  List<Bind> get binds => [
        $AppController,
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: TrackModule(),
        ),
      ];
}
