import 'package:firebase_wallpaper_app/modules/collections/service/collections_service.dart';
import 'package:firebase_wallpaper_app/modules/explore/model/wallpaper_data_model.dart';
import 'package:flutter/material.dart';

class CollectionsViewModel extends ChangeNotifier {
  List<Map<String, dynamic>>? allCollections = [];
  List<dynamic>? wallpapers = [];

  Map<String, dynamic> selectedCollection = {};

  final _collectionService = CollectionsService();

  String _selectedValue = 'public';

  String get selectedValue => _selectedValue;

  void setSelectedValue(String newValue) {
    _selectedValue = newValue;
    notifyListeners();
  }

  void createCollection(String collectionName) {
    _collectionService.createCollection(collectionName, _selectedValue);
    notifyListeners();
  }

  void getAllCollections() async {
    final collections = await _collectionService.fetchAllCollections();
    allCollections = collections;
    notifyListeners();
  }

  void getCollectionWallpapers(Map collection) async {
    wallpapers = await _collectionService.getCollectionWallpapers(
        collection["name"], collection["status"]);
    notifyListeners();
  }

  void clearWallpapers() {
    wallpapers = [];
    notifyListeners();
  }

  void removeWallpaperFromCollection(
      Map collection, WallpaperDataModel wallpaper) {
    _collectionService.removeWallpaperFromCollection(collection, wallpaper);
    notifyListeners();
  }
}
