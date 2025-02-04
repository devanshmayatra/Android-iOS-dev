import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_wallpaper_app/shared/show_snackbar.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final _googleSignIn = GoogleSignIn();
  final _firebaseAuth = FirebaseAuth.instance;

  User getUser() {
    return _firebaseAuth.currentUser!;
  }

  Future<User> signInWithGoogle() async {
    final googleAccount = await _googleSignIn.signIn();
    final googleAuth = await googleAccount?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    return userCredential.user!;
  }

  Future<void> logoutUser() async {
    await _firebaseAuth.signOut();
  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        showSnackBar("The account already exists for that email.");
      } else {
        showSnackBar(e.message!);
      }
    }
    return null;
  }

  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        showSnackBar("Wrong password provided for that user.");
      } else {
        showSnackBar(e.message.toString());
      }
    }
    return null;
  }
}
