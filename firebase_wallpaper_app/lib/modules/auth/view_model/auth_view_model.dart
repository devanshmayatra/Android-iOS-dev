import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_wallpaper_app/modules/auth/service/firebase_auth_service.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  bool isLoading = false;
  User? _user;

  final _service = GoogleLoginService();

  bool get isAuthenticatied => _user != null;

  void loginWithGoogleClickEvent() async {
    isLoading = true;
    notifyListeners();
    _user = await _service.signInWithGoogle();
    log('Login sucess : $_user');
    isLoading = false;
    notifyListeners();
  }

  void getUser() async {
    _user = await _service.getUser();
    notifyListeners();
  }

  void logoutClickEvent() async {
    await _service.logoutUser();
    _user = null;
    notifyListeners();
  }

  void loginWithEmailPasswordEvent(String email, String password) async {
    isLoading = true;
    notifyListeners();
    _user = await _service.createUserWithEmailAndPassword(email, password);
    isLoading = false;
    notifyListeners();
  }
}
