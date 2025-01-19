import 'package:apis_user_app/pages/all_users_page.dart';
import 'package:apis_user_app/view_models/theme_view_model.dart';
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
      home: const AllUsersPage(),
    );
  }
}
