import 'package:firebase_wallpaper_app/modules/wallpaper/view/widgets/toggle_favourite.dart';
import 'package:firebase_wallpaper_app/modules/wallpaper/view_model/wallpaper_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewWallpaper extends StatefulWidget {
  const ViewWallpaper({super.key});

  @override
  State<ViewWallpaper> createState() => _ViewWallpaperState();
}

class _ViewWallpaperState extends State<ViewWallpaper> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) context.read<WallpaperViewModel>().checkIfIsfavpurite();
    });
  }

  @override
  Widget build(BuildContext context) {
    final wallpaper = context.read<WallpaperViewModel>().wallpaper;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ToggleFavourite(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // width: double.infinity,
                height: wallpaper.height.toDouble() / 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      wallpaper.src.large2x,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// child: Column(
//             children: [
//               Row(),
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     fit: BoxFit.contain,
//                     image: NetworkImage(
//                       context.read<WallpaperViewModel>().wallpaper.src.large,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
