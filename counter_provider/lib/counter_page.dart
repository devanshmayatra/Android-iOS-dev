import 'package:counter_provider/counter_app.dart';
import 'package:counter_provider/counter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterViewModel(),
      child: const CounterApp(),
    );
  }
}
