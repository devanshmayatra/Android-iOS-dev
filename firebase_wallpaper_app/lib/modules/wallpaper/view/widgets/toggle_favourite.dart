import 'package:firebase_wallpaper_app/modules/wallpaper/view_model/wallpaper_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToggleFavourite extends StatelessWidget {
  const ToggleFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<WallpaperViewModel, bool?>(
      selector: (context, vm) => vm.isFavourite,
      builder: (context, isFavourite, child) {
        if (isFavourite == null) return const SizedBox();
        return IconButton(
          icon: Icon(
            isFavourite
                ? Icons.favorite_rounded
                : Icons.favorite_outline_rounded,
          ),
          onPressed: () {
            context.read<WallpaperViewModel>().addToFavouriteClickEvent();
          },
        );
      },
    );
  }
}
