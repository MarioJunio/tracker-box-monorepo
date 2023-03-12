import 'package:commons_dependencies/main.dart';

part 'app_controller.g.dart';

final $AppController = BindInject(
  (i) => AppController(),
  isSingleton: true,
  isLazy: true,
);
class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {}
