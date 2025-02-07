import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_wallpaper_app/modules/auth/model/user_model.dart';

class UserDatabaseService {
  final _client = FirebaseFirestore.instance;

  Future<UserModel?> createUser(UserModel user) async {
    try {
      final ref = _client.collection('users').doc(user.id);
      await ref.set(user.toMap());
      return user;
    } catch (e, s) {
      log('Error creating user: $e $s');
    }
    return null;
  }
}
