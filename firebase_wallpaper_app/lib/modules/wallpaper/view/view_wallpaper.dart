import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_wallpaper_app/modules/wallpaper/view/widgets/toggle_favourite.dart';
import 'package:firebase_wallpaper_app/modules/wallpaper/view_model/wallpaper_view_model.dart';

class ViewWallpaper extends StatefulWidget {
  const ViewWallpaper({super.key});

  @override
  State<ViewWallpaper> createState() => _ViewWallpaperState();
}

class _ViewWallpaperState extends State<ViewWallpaper> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WallpaperViewModel>().checkIfIsfavpurite();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<WallpaperViewModel>(
        builder: (context, wallpaperViewModel, child) {
          final wallpaper = wallpaperViewModel.wallpaper;
          final allCollections = wallpaperViewModel.allCollections;
          final selectedCollection = wallpaperViewModel.selectedCollection;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: ToggleFavourite(),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: wallpaper.height.toDouble() / 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(wallpaper.src.large2x),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    wallpaper.photographer,
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            wallpaperViewModel.getAllCollections();
                            wallpaperViewModel.setAddToCollection();
                          },
                          child: const Text("Add to Collection"),
                        ),
                        context.watch<WallpaperViewModel>().addToCollection
                            ? DropdownButton<String>(
                                value: selectedCollection.isNotEmpty
                                    ? selectedCollection["name"]
                                    : null,
                                hint: const Text("Select Collection"),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    final selected = allCollections.firstWhere(
                                      (collection) =>
                                          collection["name"] == newValue,
                                      orElse: () => {},
                                    );
                                    wallpaperViewModel.setSelectedCOllection(
                                        selected, wallpaper);
                                  }
                                },
                                items: allCollections!
                                    .map<DropdownMenuItem<String>>(
                                        (collection) {
                                  String collectionName = collection["name"];
                                  bool isPrivate =
                                      (collection["status"] == "private");
                                  return DropdownMenuItem<String>(
                                    value: collectionName,
                                    child: Text(
                                        "$collectionName (${isPrivate ? "Private" : "Public"})"),
                                  );
                                }).toList(),
                              )
                            : SizedBox()
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
