import 'package:flutter/material.dart';

class NewUpdatesItems extends StatelessWidget {
  const NewUpdatesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 24, 24, 24),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Daily Drive',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'A mix of news and',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
              ),
              Text(
                'podcasts for you.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
