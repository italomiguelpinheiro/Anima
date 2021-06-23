import 'package:anima/app/shared/auth/auth_controller.dart';
import 'package:anima/app/shared/database/configs_reposiroty/configs_database_repository_interface.dart';
import 'package:anima/app/shared/models/config_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConfigDatabaseRepository implements IConfigsDatabaseRepository {
  final FirebaseFirestore firestore;
  final AuthController auth = Modular.get();

  ConfigDatabaseRepository(this.firestore);

  @override
  Future<void> addConfigs(
      bool nudgets,
      bool emotions,
      bool confrontation,
      bool googleCalendar,
      bool challengesTotalReduction,
      bool challengesDowntimeApp) {
    final uid = auth.getCurrentUser()?.uid;
    CollectionReference configs =
        firestore.collection('users').doc(uid).collection("configs");
    return configs
        .add({
          'nudgets': nudgets,
          'emotions': emotions,
          'confrontation': confrontation,
          'googleCalendar': googleCalendar,
          'challengesTotalReduction': challengesTotalReduction,
          'challengesDowntimeApp': challengesDowntimeApp,
        })
        .then((value) => print("Config Added"))
        .catchError((error) => print("Failed to add Config: $error"));
  }

  @override
  CollectionReference<ConfigModel> getConfigs() {
    final uid = auth.getCurrentUser()?.uid;
    final configRef = firestore
        .collection("users")
        .doc(uid)
        .collection("configs")
        .withConverter<ConfigModel>(
          fromFirestore: (snapshot, _) =>
              ConfigModel.fromJson(snapshot.data()!),
          toFirestore: (configModel, _) => configModel.toJson(),
        );
    return configRef;
  }
}
