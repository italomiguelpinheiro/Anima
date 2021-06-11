import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository{

  User? getUser();
  Future<UserCredential> getGoogleLogin();
  Future getEmailPasswordLogin();
  Future<String> getToken();
  Future getLogout();
  
}