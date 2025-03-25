import 'package:firebase_wallpaper_app/modules/collections/view_model/collections_view_model.dart';
import 'package:firebase_wallpaper_app/modules/explore/view/widgtets/wallpaper_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollectionDetails extends StatelessWidget {
  const CollectionDetails({super.key, required this.collection});
  final Map collection;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop) {
          context.read<CollectionsViewModel>().clearWallpapers();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(collection["name"]),
        ),
        body: Selector<CollectionsViewModel, List?>(
          selector: (_, vm) => vm.wallpapers,
          builder: (context, wallpapers, child) {
            if (wallpapers == null || wallpapers.isEmpty) {
              return const Center(child: Text("No images in this collection"));
            }
            return NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification.metrics.pixels ==
                    notification.metrics.maxScrollExtent) {
                  context
                      .read<CollectionsViewModel>()
                      .getCollectionWallpapers(collection);
                }
                return false;
              },
              child:
                  WallpaperGrid(wallpapers: wallpapers, collection: collection),
            );
          },
        ),
      ),
    );
  }
}
