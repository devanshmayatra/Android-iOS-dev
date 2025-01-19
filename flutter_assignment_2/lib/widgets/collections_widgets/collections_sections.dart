import 'package:flutter/material.dart';

class CollectionsSections extends StatelessWidget {
  const CollectionsSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: const BoxDecoration(
              border: Border(
            bottom: BorderSide(color: Colors.grey, width: 1),
          )),
          child: const Text(
            'Subscriptions',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              border: Border(
            bottom:
                BorderSide(color: Color.fromARGB(255, 203, 255, 239), width: 2),
          )),
          child: const Text(
            'History',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 203, 255, 239),
            ),
          ),
        ),
      ],
    );
  }
}
