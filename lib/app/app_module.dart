import 'package:anima/app/app_controller.dart';
import 'package:anima/app/modules/login/login_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:anima/app/shared/auth/auth_controller.dart';
import 'package:anima/app/shared/auth/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:anima/app/app_widget.dart';
import 'package:anima/app/modules/home/home_module.dart';
import 'shared/auth/repository/auth_repository_interface.dart';

class AppModule extends MainModule {
   @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: LoginModule()),
        ModularRouter("/home", module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
