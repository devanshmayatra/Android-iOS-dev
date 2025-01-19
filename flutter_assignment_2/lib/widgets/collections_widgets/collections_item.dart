import 'package:flutter/material.dart';

class CollectionsItem extends StatelessWidget {
  const CollectionsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: double.maxFinite,
        margin: const EdgeInsets.only(top: 20, right: 16, left: 16),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rewind 2022',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '9 Videos | 56.17 mins',
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
