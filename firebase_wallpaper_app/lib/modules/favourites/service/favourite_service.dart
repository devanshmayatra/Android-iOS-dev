import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_wallpaper_app/modules/auth/service/firebase_auth_service.dart';
import 'package:firebase_wallpaper_app/modules/explore/model/wallpaper_data_model.dart';

class FavouriteService {
  final _client = FirebaseFirestore.instance;
  final _authService = FirebaseAuthService();

  Future<List<WallpaperDataModel>?> getAllFavourites() async {
    final currUser = await _authService.getUser();
    log(' user = ${currUser.toString()}');
    if (currUser == null) return null;
    final ref =
        _client.collection('users').doc(currUser.uid).collection('favourites');

    final snapshot = await ref.get();
    return snapshot.docs
        .map((doc) => WallpaperDataModel.fromMap(doc.data()))
        .toList();
  }
}
