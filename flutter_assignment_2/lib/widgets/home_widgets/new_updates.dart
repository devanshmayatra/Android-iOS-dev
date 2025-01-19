import 'package:flutter/material.dart';
import 'package:flutter_assignment_2/widgets/home_widgets/new_updates_items.dart';

class NewUpdates extends StatelessWidget {
  const NewUpdates({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
      width: double.maxFinite,
      // height: 200,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.0,
          color: const Color.fromARGB(221, 0, 0, 0),
        ),
      ),
      child: const Column(
        children: [
          Row(
            children: [
              Text(
                'New Updates',
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              Text(
                'See All',
                style: TextStyle(
                    color: Color.fromARGB(175, 45, 161, 113), fontSize: 12),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                NewUpdatesItems(),
                NewUpdatesItems(),
                NewUpdatesItems(),
                NewUpdatesItems(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
