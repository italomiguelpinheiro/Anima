import 'package:anima/app/shared/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  late ReactionDisposer disposer;
  late String rout; 
  @override
  void initState() {
    super.initState();
    disposer = autorun((_){
      final auth = Modular.get<AuthController>();
      if (auth.status == AuthStatus.login){
        rout = '/home';
      } else{
        if (auth.status == AuthStatus.logoff){
          rout = '/';
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    disposer();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: rout,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
