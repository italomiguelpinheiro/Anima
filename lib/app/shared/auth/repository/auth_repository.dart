import 'package:anima/app/shared/auth/repository/auth_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository implements IAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<UserCredential?> getEmailPasswordLogin() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: "barry.allen@example.com",
              password: "SuperSecretPassword!");

      await _firebaseFirestore
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({});
      await _firebaseFirestore
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({});

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
  Future<UserCredential> getGoogleLogin() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print('credential $credential');
    // Once signed in, return the UserCredential
    UserCredential userCredential =
        await _auth.signInWithCredential(credential);

    await _firebaseFirestore
        .collection('users')
        .doc(userCredential.user?.uid)
        .set({});
    await _firebaseFirestore
        .collection('users')
        .doc(userCredential.user?.uid)
        .set({});

    return userCredential;
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
