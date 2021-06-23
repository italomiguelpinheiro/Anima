import 'emotion_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'emotion_page.dart';

class EmotionModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => EmotionController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => EmotionPage()),
      ];

  static Inject get to => Inject<EmotionModule>.of();
}
