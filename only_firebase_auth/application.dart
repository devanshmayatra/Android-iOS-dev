import 'package:firebase_wallpaper_app/global_provider.dart';
import 'package:firebase_wallpaper_app/material_app.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalProvider(
      child: MaterialAppWidget(),
    );
  }
}
