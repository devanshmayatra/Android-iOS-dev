import 'package:firebase_wallpaper_app/modules/explore/model/wallpaper_data_model.dart';
import 'package:firebase_wallpaper_app/modules/explore/view/widgtets/wallpaper_grid.dart';
import 'package:firebase_wallpaper_app/modules/favourites/view_model/favourite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) context.read<FavouriteViewModel>().fetchWallpapers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<FavouriteViewModel, List<WallpaperDataModel>>(
      selector: (_, vm) => vm.wallpapers,
      builder: (context, wallpapers, child) {
        return RefreshIndicator(
          onRefresh: context.read<FavouriteViewModel>().fetchWallpapers,
          child: WallpaperGrid(
            wallpapers: wallpapers,
          ),
        );
      },
    );
  }
}
