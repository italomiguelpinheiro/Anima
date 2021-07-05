import 'sing_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'sing_page.dart';

class SingModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SingController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SingPage()),
      ];

  static Inject get to => Inject<SingModule>.of();
}
