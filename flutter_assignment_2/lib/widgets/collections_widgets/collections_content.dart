import 'package:flutter/material.dart';
import 'package:flutter_assignment_2/widgets/collections_widgets/collections_item.dart';

class CollectionsContent extends StatelessWidget {
  const CollectionsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CollectionsItem(),
          CollectionsItem(),
          CollectionsItem(),
          CollectionsItem(),
        ],
      ),
    );
  }
}
