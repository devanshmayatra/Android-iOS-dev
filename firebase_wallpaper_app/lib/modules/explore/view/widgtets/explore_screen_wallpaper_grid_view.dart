import 'package:firebase_wallpaper_app/modules/explore/model/wallpaper_data_model.dart';
import 'package:firebase_wallpaper_app/modules/explore/view/widgtets/wallpaper_grid.dart';
import 'package:firebase_wallpaper_app/modules/explore/view_model/explore_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExploreScreenWallpaperGridView extends StatefulWidget {
  const ExploreScreenWallpaperGridView({super.key});

  @override
  State<ExploreScreenWallpaperGridView> createState() =>
      _ExploreScreenWallpaperGridViewState();
}

class _ExploreScreenWallpaperGridViewState
    extends State<ExploreScreenWallpaperGridView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        context.read<ExploreViewModel>().fetchWallpaper();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Selector<ExploreViewModel, List<WallpaperDataModel>>(
        selector: (_, vm) => vm.wallpapers,
        builder: (context, wallpapers, child) {
          return WallpaperGrid(wallpapers: wallpapers);
        },
      ),
    );
  }
}

// GridView.builder(
//             itemCount: wallpapers.length,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 9 / 16,
//               crossAxisSpacing: 0,
//               mainAxisSpacing: 0,
//             ),
//             itemBuilder: (context, index) {
//               final wallpaper = wallpapers[index];
//               return GestureDetector(
//                 onTap: () {},
//                 child: Padding(
//                   padding: EdgeInsets.all(8),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       image: DecorationImage(
//                         image: NetworkImage(wallpaper.src.medium),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     child: Container(),
//                   ),
//                 ),
//               );
//             },
//           );
