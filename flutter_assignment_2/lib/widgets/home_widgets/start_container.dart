import 'package:flutter/material.dart';

class StartContainer extends StatelessWidget {
  const StartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: Colors.black87,
      ),
      child: Column(
        children: [
          Container(
            width: 300,
            height: 150,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 203, 255, 239),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'SIgn up for free',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 118, 164),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  'To start listening.',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 118, 164),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  'Enjoy podcasts everywhere',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 118, 164),
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                Container(
                  height: 30,
                  width: 90,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 118, 164),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Try for free',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
