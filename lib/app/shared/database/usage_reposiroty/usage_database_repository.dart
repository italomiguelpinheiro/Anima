import 'package:anima/app/shared/auth/auth_controller.dart';
import 'package:anima/app/shared/models/usage_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'usage_database_repository_interface.dart';

class UsageDatabaseRepository implements IUsageDatabaseRepository {
  final FirebaseFirestore firestore;
  final AuthController auth = Modular.get();

  UsageDatabaseRepository(this.firestore);

  @override
  Future<void> addUsage(
    String firstTimeStamp,
    String lastTimeStamp,
    String packageName,
    String lastTimeUsed,
    String totalTimeInForeground,
  ) {
    final uid = auth.getCurrentUser()?.uid;
    CollectionReference events = firestore
        .collection('users')
        .doc(uid)
        .collection("apps")
        .doc(packageName)
        .collection("usages");
    return events
        .add({
          'firstTimeStamp': firstTimeStamp,
          'lastTimeStamp': lastTimeStamp,
          'packageName': packageName,
          'lastTimeUsed': lastTimeUsed,
          'totalTimeInForeground': totalTimeInForeground,
        })
        .then((value) => print("Usage Added"))
        .catchError((error) => print("Failed to add Usage: $error"));
  }

  @override
  CollectionReference<UsageModel> getUsages() {
    final uid = auth.getCurrentUser()?.uid;
    final eventRef = firestore
        .collection("users")
        .doc(uid)
        .collection("events")
        .withConverter<UsageModel>(
          fromFirestore: (snapshot, _) => UsageModel.fromJson(snapshot.data()!),
          toFirestore: (usageModel, _) => usageModel.toJson(),
        );
    return eventRef;
  }
}
