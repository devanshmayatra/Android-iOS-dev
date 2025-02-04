import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.photoUrl,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      id: user.uid,
      userName: user.displayName,
      email: user.email,
      phoneNumber: user.phoneNumber,
      photoUrl: user.photoURL,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      userName: map['userName'] as String?,
      email: map['email'] as String?,
      phoneNumber: map['phoneNumber'] as String?,
      photoUrl: map['photoUrl'] as String?,
    );
  }

  final String id;
  final String? userName;
  final String? email;
  final String? phoneNumber;
  final String? photoUrl;

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "userName": userName,
      "email": email,
      "phoneNumber": phoneNumber,
      "photoURL": photoUrl,
    };
  }
}
