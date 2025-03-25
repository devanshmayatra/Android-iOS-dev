import 'package:firebase_wallpaper_app/modules/auth/view_model/auth_view_model.dart';
import 'package:firebase_wallpaper_app/modules/get_started/view/get_started.dart';
import 'package:firebase_wallpaper_app/modules/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetStartedGaurd extends StatefulWidget {
  const GetStartedGaurd({super.key});

  @override
  State<GetStartedGaurd> createState() => _GetStartedGuard();
}

class _GetStartedGuard extends State<GetStartedGaurd> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        if (mounted) context.read<AuthViewModel>().getUser();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Selector<AuthViewModel, bool>(
      selector: (context, viewModel) => viewModel.isAuthenticatied,
      builder: (context, isAuthenticatied, child) {
        if (!isAuthenticatied) return GetStarted();
        return const HomeScreen();
      },
    );
  }
}
