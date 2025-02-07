import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_wallpaper_app/modules/auth/model/user_model.dart';
import 'package:firebase_wallpaper_app/modules/auth/service/firebase_auth_service.dart';
import 'package:firebase_wallpaper_app/modules/auth/service/user_database_service.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  bool isLoading = false;
  User? _user;
  String? _error;

  String get error => _error ?? "";

  final _service = FirebaseAuthService();
  final _userService = UserDatabaseService();

  bool get isAuthenticatied => _user != null;

  void loginWithGoogleClickEvent() async {
    isLoading = true;
    notifyListeners();
    _user = (await _service.signInWithGoogle());
    if (_user != null) {
      final userModel =
          await _userService.createUser(UserModel.fromFirebaseUser(_user!));
    }
    isLoading = false;
    notifyListeners();
  }

  void getUser() async {
    _user = (await _service.getUser());
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
      _user = (await _service.createUserWithEmailAndPassword(email, password));

      if (_user != null) {
        final userModel =
            await _userService.createUser(UserModel.fromFirebaseUser(_user!));
      }
      isLoading = false;
      notifyListeners();
    }
  }

  void loginWithEmailAndPassword(String email, String password) async {
    if (email != "" && password != "") {
      isLoading = true;
      notifyListeners();
      _user = await _service.loginWithEmailAndPassword(email, password);
      isLoading = false;

      notifyListeners();
    }
  }
}
