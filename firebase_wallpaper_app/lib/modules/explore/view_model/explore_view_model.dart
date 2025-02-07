import 'package:firebase_wallpaper_app/modules/explore/model/wallpaper_data_model.dart';
import 'package:firebase_wallpaper_app/modules/explore/service/exlpore_fetch_images_service.dart';
import 'package:flutter/material.dart';

class ExploreViewModel extends ChangeNotifier {
  List<WallpaperDataModel> wallpapers = [];
  List<WallpaperDataModel> tempWallpapers = [];

  final _service = ExlporeFetchImagesService();
  String _error = "";

  String get error => _error;

  void fetchWallpaper() async {
    final response = await _service.getWallpapers(1, 10);
    response.fold(
      (l) {
        _error = 'Error: $l';
      },
      (r) {
        tempWallpapers = r.photos;
        wallpapers = wallpapers + tempWallpapers;
        notifyListeners();
      },
    );
  }
}
