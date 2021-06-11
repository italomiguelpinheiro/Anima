import 'package:anima/app/shared/auth/repository/auth_repository_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository implements IAuthRepository{
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future getEmailPasswordLogin() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "barry.allen@example.com",
        password: "SuperSecretPassword!"
      );
      print('userCredential $userCredential');
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
  Future<UserCredential> getGoogleLogin() async {
   // Trigger the authentication flow
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
  print('googleUser $googleUser');
  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  print('googleAuth $googleAuth');
  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
   print('credential $credential');
  // Once signed in, return the UserCredential
  return await _auth.signInWithCredential(credential);
  }

  @override
  Future<String> getToken() async {
    final user = _auth.currentUser;
    if (user != null) {
      final token = await user.getIdToken();
      return token;
    }
    return "";
  }

  @override
  User? getUser() {
      return _auth.currentUser;
  }

  @override
  Future getLogout() {
    return _auth.signOut();
  }

}