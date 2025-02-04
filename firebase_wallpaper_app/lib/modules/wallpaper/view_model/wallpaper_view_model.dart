import 'dart:developer';

import 'package:firebase_wallpaper_app/modules/explore/model/wallpaper_data_model.dart';
import 'package:firebase_wallpaper_app/modules/wallpaper/service/wallpaper_service.dart';
import 'package:flutter/material.dart';

class WallpaperViewModel extends ChangeNotifier {
  WallpaperViewModel({required this.wallpaper});
  final WallpaperDataModel wallpaper;

  bool? isFavourite;

  final _service = WallpaperService();

  void checkIfIsfavpurite() async {
    isFavourite = await _service.checkIsFavourite(wallpaper);
    log(isFavourite.toString());
    notifyListeners();
  }

  void addToFavouriteClickEvent() async {
    if (isFavourite == true) {
      await _service.removeFromFavpurites(wallpaper);
      isFavourite = false;
    } else {
      await _service.addToFavourites(wallpaper);
      isFavourite = true;
    }
    notifyListeners();
  }
}
