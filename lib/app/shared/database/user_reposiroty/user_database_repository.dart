import 'package:anima/app/shared/auth/auth_controller.dart';
import 'package:anima/app/shared/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'user_database_repository_interface.dart';

class UserDatabaseRepository implements IUserDatabaseRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthController auth = Modular.get();

  UserDatabaseRepository(this.firestore);

  @override
  Future<UserCredential?> addUser(
    String displayName,
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  DocumentReference<UserModel> getUser(String uid) {
    final uid = auth.getCurrentUser()?.uid;
    final userRef = firestore
        .collection("users")
        .doc(uid)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (usageModel, _) => usageModel.toJson(),
        );
    return userRef;
  }
}
