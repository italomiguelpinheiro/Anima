import 'package:flutter/material.dart';
import 'package:anima/app/app_module.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<void> initializeDefault() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
  assert(app != null);
  print('Initialized default app $app');
  runApp(ModularApp(module: AppModule()));
}

void main() => {
  initializeDefault()
};
