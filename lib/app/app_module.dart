import 'package:anima/app/app_controller.dart';
import 'package:anima/app/modules/home/home_controller.dart';
import 'package:anima/app/modules/home/home_module.dart';
import 'package:anima/app/modules/home/home_page.dart';
import 'package:anima/app/modules/login/login_controller.dart';
import 'package:anima/app/modules/login/login_module.dart';
import 'package:anima/app/modules/login/login_page.dart';
import 'package:anima/app/modules/splash/splash_page.dart';
import 'package:anima/app/shared/auth/repository/auth_repository.dart';
import 'package:anima/app/shared/auth/repository/dio_repository.dart';
import 'package:anima/app/shared/auth/auth_controller.dart';
import 'package:anima/app/shared/database/database_controller.dart';
import 'package:anima/app/shared/database/repository/database_repository.dart';
import 'package:anima/app/shared/database/repository/database_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:anima/app/app_widget.dart';

import 'shared/auth/repository/auth_repository_interface.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => AuthController()),
        Bind((i) => LoginController()),
        Bind((i) => HomeController()),
        Bind((i) => DatabaseController()),
        Bind<IDatabaseRepository>(
            (i) => DatabaseRepository(FirebaseFirestore.instance)),
        Bind<IAuthRepository>((i) => AuthRepository()),
        //Bind((i) => LocalStorageHive()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (i, args) => SplashPage()),
        ModularRouter('/login', child: (i, args) => LoginPage()),
        ModularRouter('/home', child: (i, args) => HomePage())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
