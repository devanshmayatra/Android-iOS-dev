import 'package:firebase_wallpaper_app/modules/collections/view/collection_screen_provider.dart';
import 'package:firebase_wallpaper_app/modules/explore/view/explore_screen_provider.dart';
import 'package:firebase_wallpaper_app/modules/favourites/view/favourite_view_provider.dart';
import 'package:firebase_wallpaper_app/modules/home/model/bottom_nav_model.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final navigationItems = const [
    BottomNavModel(
      name: 'Explore',
      icon: Icon(Icons.search),
      page: ExplorePageProvider(),
    ),
    BottomNavModel(
      name: 'Collections',
      icon: Icon(Icons.collections),
      page: CollectionScreenProvider(),
    ),
    BottomNavModel(
      name: 'Favourites',
      icon: Icon(Icons.favorite),
      page: FavouriteViewProvider(),
    ),
  ];

  int selectedIndex = 0;

  void indexChangedEvent(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Widget get selectedPage => navigationItems[selectedIndex].page;
}
