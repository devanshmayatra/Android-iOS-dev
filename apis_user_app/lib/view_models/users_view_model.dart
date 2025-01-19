import 'dart:developer';

import 'package:apis_user_app/service/fetch_api.dart';
import 'package:flutter/material.dart';

class UsersViewModel extends ChangeNotifier {
  FetchApi service = FetchApi();
  List _users = [];
  String _tag = "";

  List get users => _users;
  String get selector => _tag;

  Future<void> getUsers(String gender) async {
    final response = await service.getUserDataResponse(gender);
    _users = response!.users;
    _tag = gender;
    notifyListeners();
  }
}
