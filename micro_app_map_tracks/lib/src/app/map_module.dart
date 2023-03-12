import 'package:commons_dependencies/main.dart';

import 'presentation/views/map/map_controller.dart';
import 'presentation/views/map/map_page.dart';

class MapModule extends Module {
  @override
  List<Module> imports = [];

  @override
  final List<Bind> binds = [
    $MapController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) {
      return const MapPage();
    }),
  ];
}
