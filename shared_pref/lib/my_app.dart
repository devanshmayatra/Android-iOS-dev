import 'package:flutter/material.dart';
import 'package:shared_pref/shared_pref_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Shared Preference Demo'),
        ),
        body: SharedPrefScreen(),
      ),
    );
  }
}
