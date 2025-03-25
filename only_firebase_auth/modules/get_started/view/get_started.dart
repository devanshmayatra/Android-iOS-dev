import 'package:firebase_wallpaper_app/modules/auth/view/auth_screen.dart';
import 'package:firebase_wallpaper_app/modules/auth/view/register_screen.dart';
import 'package:firebase_wallpaper_app/modules/auth/view_model/auth_view_model.dart';
import 'package:firebase_wallpaper_app/modules/theme/view_model/theme_view_model.dart';
import 'package:firebase_wallpaper_app/shared/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel = context.watch<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(),
      body: authViewModel.isLoading
          ? LoadingScreen()
          : Padding(
              padding: const EdgeInsets.only(
                left: 28,
                top: 10,
                right: 28,
                bottom: 10,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 60),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            context.watch<ThemeViewModel>().isDarkMode
                                ? Colors.white
                                : Colors.black,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return ChangeNotifierProvider.value(
                                value: authViewModel,
                                child: AuthScreen(),
                              );
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: context.watch<ThemeViewModel>().isDarkMode
                              ? Colors.black
                              : Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            context.watch<ThemeViewModel>().isDarkMode
                                ? Colors.white
                                : Colors.black,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return ChangeNotifierProvider.value(
                                value: authViewModel,
                                child: RegisterScreen(),
                              );
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: context.watch<ThemeViewModel>().isDarkMode
                              ? Colors.black
                              : Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
