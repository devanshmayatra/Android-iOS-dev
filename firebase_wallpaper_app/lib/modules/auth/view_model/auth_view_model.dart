import 'dart:developer';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_wallpaper_app/modules/auth/service/firebase_auth_service.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  bool isLoading = false;
  Either<String, User>? _user;

  final _service = GoogleLoginService();

  bool get isAuthenticatied => _user != null;

  void loginWithGoogleClickEvent() async {
    isLoading = true;
    notifyListeners();
    _user = (await _service.signInWithGoogle()) as Either<String, User>?;
    log('Login sucess : $_user');
    isLoading = false;
    notifyListeners();
  }

  void getUser() async {
    _user = (await _service.getUser()) as Right<String, User>?;
    notifyListeners();
  }

  void logoutClickEvent() async {
    await _service.logoutUser();
    _user = null;
    notifyListeners();
  }

  void signupWithEmailPasswordEvent(String email, String password) async {
    if (email != "" && password != "") {
      isLoading = true;
      notifyListeners();
      _user = (await _service.createUserWithEmailAndPassword(email, password))
          as Either<String, User>?;
      isLoading = false;
      log("Created account and Login success from email and password");
      notifyListeners();
    }
  }

  void loginWithEmailAndPassword(String email, String password) async {
    if (email != "" && password != "") {
      isLoading = true;
      notifyListeners();
      _user = await _service.loginWithEmailAndPassword(email, password)
          as Either<String, User>?;
      isLoading = false;
      log("Login success from email and password");

      notifyListeners();
    }
  }
}
