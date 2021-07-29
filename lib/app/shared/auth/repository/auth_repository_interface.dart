import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  User? getUser();
  Future<UserCredential> getGoogleLogin();
  Future<UserCredential?> getEmailPasswordLogin(
    String email,
    String password,
  );
  Future<String> getToken();
  Future getLogout();
}
