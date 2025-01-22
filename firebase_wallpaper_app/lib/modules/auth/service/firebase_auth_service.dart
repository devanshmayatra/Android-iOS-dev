import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginService {
  final _googleSignIn = GoogleSignIn();
  final _firebaseAuth = FirebaseAuth.instance;

  Future<User?> getUser() async {
    return _firebaseAuth.currentUser;
  }

  Future<User?> signInWithGoogle() async {
    final googleAccount = await _googleSignIn.signIn();
    final googleAuth = await googleAccount?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    return userCredential.user;
  }

  Future<void> logoutUser() async {
    await _firebaseAuth.signOut();
  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: "barry.allen@example.com",
        password: "SuperSecretPassword!",
      );

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (e) {
      log(e as String);
    }
  }

  Future<User?> signInWithEmailAndPassword(UserCredential userCredential) {
    return user;
  }
}
