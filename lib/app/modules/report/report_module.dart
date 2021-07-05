import 'dart:html';

import 'report_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'report_page.dart';

class ReportModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ReportController())
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ReportPage()),
      ];

  static Inject get to => Inject<ReportModule>.of();
}
