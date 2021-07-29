import 'package:anima/app/shared/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IUserDatabaseRepository {
  Future<UserCredential?> addUser(
    String displayName,
    String email,
    String password,
  );

  DocumentReference<UserModel> getUser(String uid);
}
