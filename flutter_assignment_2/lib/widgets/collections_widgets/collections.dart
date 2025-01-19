import 'package:flutter/material.dart';
import 'package:flutter_assignment_2/widgets/collections_widgets/collections_content.dart';
import 'package:flutter_assignment_2/widgets/collections_widgets/collections_sections.dart';

class Collections extends StatelessWidget {
  const Collections({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: const Text(
            'Collections',
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
        CollectionsSections(),
        CollectionsContent(),
      ],
    );
  }
}
