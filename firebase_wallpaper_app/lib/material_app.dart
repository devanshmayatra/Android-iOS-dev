import 'package:firebase_wallpaper_app/core/util/global_key.dart';
import 'package:firebase_wallpaper_app/modules/auth/view/auth_guard.dart';
import 'package:firebase_wallpaper_app/modules/theme/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MaterialAppWidget extends StatelessWidget {
  MaterialAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Listen for theme changes via ThemeViewModel
    final themeData = context.watch<ThemeViewModel>().themeData;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey, // Assign the key
      theme: themeData, // Use the theme from the provider
      home: const AuthGuard(), // Set the initial screen
    );
  }
}
