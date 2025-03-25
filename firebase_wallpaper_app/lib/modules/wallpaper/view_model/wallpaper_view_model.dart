import 'package:firebase_wallpaper_app/modules/collections/service/collections_service.dart';
import 'package:firebase_wallpaper_app/modules/explore/model/wallpaper_data_model.dart';
import 'package:firebase_wallpaper_app/modules/wallpaper/service/wallpaper_service.dart';
import 'package:flutter/material.dart';

class WallpaperViewModel extends ChangeNotifier {
  WallpaperViewModel({required this.wallpaper});
  final WallpaperDataModel wallpaper;
  // final Map collection;

  bool? isFavourite;

  final _service = WallpaperService();
  final _collectionService = CollectionsService();
  List<Map<String, dynamic>>? allCollections = [];
  Map<String, dynamic> selectedCollection = {};
  bool addToCollection = false;

  void checkIfIsfavpurite() async {
    isFavourite = await _service.checkIsFavourite(wallpaper);
    notifyListeners();
  }

  void setSelectedCOllection(
      Map<String, dynamic> value, WallpaperDataModel wallpaper) {
    selectedCollection = value;
    addToCollection = false;
    _collectionService.addImageToCOllection(value, wallpaper);
    notifyListeners();
  }

  void getAllCollections() async {
    final collections = await _collectionService.fetchAllCollections();
    allCollections = collections;
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

  void setAddToCollection() {
    addToCollection = !addToCollection;
    notifyListeners();
  }
}
