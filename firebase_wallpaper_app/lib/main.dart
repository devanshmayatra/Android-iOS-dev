import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_wallpaper_app/application.dart';
import 'package:firebase_wallpaper_app/core/env_service.dart';
import 'package:firebase_wallpaper_app/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvService.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Application());
}
