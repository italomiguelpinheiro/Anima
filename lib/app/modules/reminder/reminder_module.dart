import 'reminder_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'reminder_page.dart';

class ReminderModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ReminderController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ReminderPage()),
      ];

  static Inject get to => Inject<ReminderModule>.of();
}
