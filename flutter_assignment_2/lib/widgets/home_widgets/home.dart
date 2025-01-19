import 'package:flutter/material.dart';
import 'package:flutter_assignment_2/widgets/home_widgets/new_updates.dart';
import 'package:flutter_assignment_2/widgets/home_widgets/start_container.dart';
import 'package:flutter_assignment_2/widgets/home_widgets/subscriptions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: const Text(
            '👋 Good Morning ',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          backgroundColor: Colors.black87,
        ),
        body: const MainBody(),
      ),
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        StartContainer(),
        NewUpdates(),
        Subscriptions(),
      ],
    );
  }
}
