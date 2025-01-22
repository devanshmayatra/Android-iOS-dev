import 'package:firebase_wallpaper_app/modules/home/view/widgets/bottom_navbar.dart';
import 'package:firebase_wallpaper_app/modules/home/view/widgets/change_theme_icon_button.dart';
import 'package:firebase_wallpaper_app/modules/home/view/widgets/home_screen_body.dart';
import 'package:firebase_wallpaper_app/modules/home/view/widgets/logout_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const HomeNavigationBar(),
      appBar: AppBar(
        title: const Text('Home'),
        actions: const [
          ChangeThemeIconButton(),
          LogoutButton(),
        ],
      ),
      body: const HomeScreenBody(),
      // Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       context.read<AuthViewModel>().logoutClickEvent();
      //     },
      //     child: const Text('Logout'),
      //   ),
      // ),
    );
  }
}
