import 'package:flutter/material.dart';

class SubscriptionItems extends StatelessWidget {
  const SubscriptionItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, top: 16, bottom: 16),
      height: 180,
      width: 140,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 37, 113, 255),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          const Spacer(),
          const Text(
            '364: Metta World',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            'Peace | Mettap...',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'TED TALKS | 21:37 mins',
            style: TextStyle(
              color: Color.fromARGB(255, 141, 182, 251),
              fontSize: 8,
            ),
          ),
        ],
      ),
    );
  }
}
