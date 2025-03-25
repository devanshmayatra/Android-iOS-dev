import 'package:firebase_wallpaper_app/modules/auth/view_model/auth_view_model.dart';
import 'package:firebase_wallpaper_app/modules/home/view_model/home_view_model.dart';
import 'package:firebase_wallpaper_app/modules/theme/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GlobalProvider extends StatelessWidget {
  const GlobalProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeViewModel()),
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
      ],
      child: child,
    );
  }
}
