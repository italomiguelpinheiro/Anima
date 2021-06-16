import 'package:flutter/material.dart';
import 'package:anima/app/app_module.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

bool USE_FIRESTORE_EMULATOR = false;

Future<void> initializeDefault() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
  if (USE_FIRESTORE_EMULATOR) {
    FirebaseFirestore.instance.settings = const Settings(
      host: 'localhost:8080',
      sslEnabled: false,
      persistenceEnabled: false,
    );
  }
  assert(app != null);
  print('Initialized default app $app');
  runApp(ModularApp(module: AppModule()));
}

void main() => {
  initializeDefault()
};
