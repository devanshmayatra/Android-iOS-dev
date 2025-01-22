import 'package:firebase_wallpaper_app/modules/auth/view/auth_guard.dart';
import 'package:firebase_wallpaper_app/modules/theme/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MaterialAppWIdget extends StatelessWidget {
  const MaterialAppWIdget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = context.watch<ThemeViewModel>().themeData;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const AuthGuard(),
    );
  }
}
