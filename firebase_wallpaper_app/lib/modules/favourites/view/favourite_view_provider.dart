import 'package:firebase_wallpaper_app/modules/favourites/view/favourite_screen.dart';
import 'package:firebase_wallpaper_app/modules/favourites/view_model/favourite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteViewProvider extends StatelessWidget {
  const FavouriteViewProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavouriteViewModel(),
      child: const FavouriteScreen(),
    );
  }
}
