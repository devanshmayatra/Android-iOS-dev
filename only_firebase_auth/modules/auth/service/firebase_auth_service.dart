import 'dart:core';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginService {
  final _googleSignIn = GoogleSignIn();
  final _firebaseAuth = FirebaseAuth.instance;

  Future<Either<String, User>> getUser() async {
    return await Right((_firebaseAuth.currentUser!));
  }

  Future<Either<String, User>> signInWithGoogle() async {
    final googleAccount = await _googleSignIn.signIn();
    final googleAuth = await googleAccount?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    return Right((userCredential.user!));
  }

  Future<void> logoutUser() async {
    await _firebaseAuth.signOut();
  }

  Future<Either<String, User>> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Right((userCredential.user!));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Left(("The password provided is too weak."));
      } else if (e.code == 'email-already-in-use') {
        return Left(("The account already exists for that email."));
      } else {
        return Left((e.message!));
      }
    }
  }

  Future<Either<String, User>> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Right((userCredential.user!));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Left(("No user found for that email."));
      } else if (e.code == 'wrong-password') {
        return Left(("Wrong password provided for that user."));
      } else {
        return Left((e.message.toString()));
      }
    }
  }
}
