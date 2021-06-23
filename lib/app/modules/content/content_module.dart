import 'content_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'content_page.dart';

class ContentModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ContentController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ContentPage()),
      ];

  static Inject get to => Inject<ContentModule>.of();
}
