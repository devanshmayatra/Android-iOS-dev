import 'dart:convert';
import 'package:apis_user_app/models/user_details_model.dart';

class UserModel {
  UserModel(
      {required this.users,
      required this.total,
      required this.skip,
      required this.limit});

  factory UserModel.fromJson(String jsonString) {
    return UserModel.fromMap(json.decode(jsonString) as Map<String, dynamic>);
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      users: (map['users'] as List)
          .map(
            (userMap) =>
                UserDetailsModel.fromMap(userMap as Map<String, dynamic>),
          )
          .toList(),
      total: map['total'],
      skip: map['skip'],
      limit: map['limit'],
    );
  }

  final List<UserDetailsModel> users;
  final int total;
  final int skip;
  final int limit;
}
