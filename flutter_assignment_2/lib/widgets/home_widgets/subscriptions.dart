import 'package:flutter/material.dart';
import 'package:flutter_assignment_2/widgets/home_widgets/subscriptions_items.dart';

class Subscriptions extends StatelessWidget {
  const Subscriptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.0,
          color: const Color.fromARGB(221, 0, 0, 0),
        ),
      ),
      width: double.maxFinite,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subscription',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'See All',
                style: TextStyle(
                    color: Color.fromARGB(175, 45, 161, 113), fontSize: 12),
              ),
            ],
          ),
          SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SubscriptionItems(),
                SubscriptionItems(),
                SubscriptionItems(),
                SubscriptionItems(),
                SubscriptionItems(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
