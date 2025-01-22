import 'package:firebase_wallpaper_app/modules/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<AuthViewModel>().logoutClickEvent();
      },
      child: const Text('Logout'),
    );
  }
}
