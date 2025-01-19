import 'package:counter_provider/counter_page.dart';
import 'package:counter_provider/theme_data_view_model.dart';
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
      home: const CounterPage(),
    );
  }
}
