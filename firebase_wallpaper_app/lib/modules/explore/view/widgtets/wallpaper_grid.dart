import 'package:firebase_wallpaper_app/modules/explore/view/widgtets/exlpore_screen_wallpaper_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WallpaperGrid extends StatelessWidget {
  const WallpaperGrid({super.key, required this.wallpapers});

  final List wallpapers;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      itemCount: wallpapers.length,
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        final wallpaper = wallpapers[index];
        return ExlporeScreenWallpaperGridItem(wallpaper: wallpaper);
      },
    );
  }
}
