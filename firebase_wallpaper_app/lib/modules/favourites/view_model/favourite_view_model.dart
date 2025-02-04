import 'package:firebase_wallpaper_app/modules/explore/model/wallpaper_data_model.dart';
import 'package:firebase_wallpaper_app/modules/favourites/service/favourite_service.dart';
import 'package:flutter/material.dart';

class FavouriteViewModel extends ChangeNotifier {
  final _service = FavouriteService();

  List<WallpaperDataModel> wallpapers = [];

  Future<void> fetchWallpapers() async {
    final result = await _service.getAllFavourites();
    wallpapers = result ?? [];
    notifyListeners();
  }
}
