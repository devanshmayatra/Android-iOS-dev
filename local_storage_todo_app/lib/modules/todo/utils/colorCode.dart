import 'package:flutter/material.dart';

class ColorCode {
  static Color colorCode(String tag) {
    switch (tag) {
      case 'personal':
        return const Color.fromARGB(220, 33, 149, 243);
      case 'work':
        return const Color.fromARGB(220, 121, 85, 72);
      case 'pending':
        return const Color.fromARGB(220, 244, 67, 54);
      case 'completed':
        return const Color.fromARGB(220, 76, 175, 79);
      case 'low':
        return const Color.fromARGB(220, 67, 145, 70);
      case 'medium':
        return const Color.fromARGB(220, 255, 235, 59);
      case 'high':
        return const Color.fromARGB(220, 244, 67, 54);
      default:
        return const Color.fromARGB(220, 66, 66, 66);
    }
  }
}
