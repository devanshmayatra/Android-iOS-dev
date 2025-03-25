import 'package:apis_user_app/models/user_details_model.dart';
import 'package:apis_user_app/service/fetch_api.dart';
import 'package:flutter/material.dart';

class UsersViewModel extends ChangeNotifier {
  FetchApi service = FetchApi();
  List<UserDetailsModel> _users = [];
  String _tag = "";

  List get users => _users;
  String get selector => _tag;

  Future<void> getUsers(String gender) async {
    final response = await service.getUserDataResponse(_users);
    _users = [..._users, ...response!.users];

    if (gender == "male" || gender == "female") {
      _users = _users.where((user) => user.gender == gender).toList();
    }

    _tag = gender;
    notifyListeners();
  }
}
