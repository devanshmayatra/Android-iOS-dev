import 'package:firebase_wallpaper_app/modules/explore/model/wallpaper_data_model.dart';
import 'package:firebase_wallpaper_app/modules/wallpaper/view/view_wallpaper.dart';
import 'package:firebase_wallpaper_app/modules/wallpaper/view_model/wallpaper_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WallpaperProvider extends StatelessWidget {
  const WallpaperProvider({super.key, required this.wallpaper});

  final WallpaperDataModel wallpaper;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WallpaperViewModel(wallpaper: wallpaper),
      child: const ViewWallpaper(),
    );
  }
}
