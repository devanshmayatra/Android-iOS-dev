import 'package:firebase_wallpaper_app/modules/explore/view/explore_screen.dart';
import 'package:firebase_wallpaper_app/modules/favourites/view/favourite_screen.dart';
import 'package:firebase_wallpaper_app/modules/home/model/bottom_nav_model.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final navigationItems = const [
    BottomNavModel(
      name: 'Explore',
      icon: Icon(Icons.search),
      page: ExploreScreen(),
    ),
    BottomNavModel(
      name: 'Favourites',
      icon: Icon(Icons.favorite),
      page: FavouriteScreen(),
    ),
  ];

  int selectedIndex = 0;

  void indexChangedEvent(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Widget get selectedPage => navigationItems[selectedIndex].page;
}
