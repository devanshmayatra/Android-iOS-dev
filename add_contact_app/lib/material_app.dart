import 'package:add_contact_app/pages/contact_page.dart';
import 'package:add_contact_app/view_models/theme_data_view_model.dart';
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
      home: const ContactPage(),
    );
  }
}
