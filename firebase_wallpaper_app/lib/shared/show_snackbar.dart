import 'package:firebase_wallpaper_app/core/util/global_key.dart';
import 'package:flutter/material.dart';

void showSnackBar(String message) {
  scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
    content: Text(message),
  ));
}
