import 'package:anima/app/shared/auth/auth_controller.dart';
import 'package:anima/app/shared/models/access_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_modular/flutter_modular.dart';

import 'access_database_repository_interface.dart';

class AccessDatabaseRepository implements IAccessDatabaseRepository {
  final FirebaseFirestore firestore;
  final AuthController auth = Modular.get();

  AccessDatabaseRepository(this.firestore);

  @override
  Future<void> addAccess(
      String start, String stop, String packageName, String count) {
    final uid = auth.getCurrentUser()?.uid;
    print("uid " + uid.toString());
    CollectionReference access = firestore
        .collection('users')
        .doc(uid)
        .collection("apps")
        .doc(packageName)
        .collection("access");
    return access
        .add({
          'start': start,
          'stop': stop,
          'packageName': packageName,
          'count': count,
        })
        .then((value) => print("Access Added"))
        .catchError((error) => print("Failed to add access: $error"));
  }

  @override
  CollectionReference<AccessModel> getAccess(String packageName) {
    final uid = auth.getCurrentUser()?.uid;
    final accessRef = firestore
        .collection("users")
        .doc(uid)
        .collection("apps")
        .doc(packageName)
        .collection("access")
        .withConverter<AccessModel>(
          fromFirestore: (snapshot, _) =>
              AccessModel.fromJson(snapshot.data()!),
          toFirestore: (accessModel, _) => accessModel.toJson(),
        );
    return accessRef;
  }
}
