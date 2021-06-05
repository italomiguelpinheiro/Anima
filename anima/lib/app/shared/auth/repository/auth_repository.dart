import 'package:anima/app/shared/auth/repository/auth_repository_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository implements IAuthRepository{
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  
  @override
  Future getEmailPasswordLogin() {
    // TODO: implement getEmailPasswordLogin
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> getGoogleLogin() async {
     // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

  final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  
  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<String> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future getUser() {
 throw UnimplementedError();
  }

}