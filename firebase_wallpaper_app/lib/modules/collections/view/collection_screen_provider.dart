import 'package:firebase_wallpaper_app/modules/collections/view/collections_screen.dart';
import 'package:firebase_wallpaper_app/modules/collections/view_model/collections_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollectionScreenProvider extends StatelessWidget {
  const CollectionScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CollectionsViewModel(),
      child: CollectionsScreen(),
    );
  }
}
