import 'package:counter_provider/counter_page.dart';
import 'package:counter_provider/counter_view_model.dart';
import 'package:counter_provider/login.dart';
import 'package:counter_provider/theme_data_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Counter App',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: const [
          ChangeThemeIconButton(),
          SizedBox(width: 16),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'login $hashCode',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return ChangeNotifierProvider.value(
                      value: context.read<CounterViewModel>(),
                      child: const LoginScreen(),
                    );
                  },
                ),
              );
            },
            child: const Icon(Icons.login),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: 'counter $hashCode',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CounterPage(),
                ),
              );
            },
            child: const Icon(Icons.arrow_circle_right),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilledButton(
                  onPressed: () {
                    context.read<CounterViewModel>();
                    context.read<CounterViewModel>().decrement();
                  },
                  child: const Text("Decrement"),
                ),
                FilledButton(
                  onPressed: () {
                    context.read<CounterViewModel>();
                    context.read<CounterViewModel>().increment();
                  },
                  child: const Text("Increment"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ChangeThemeIconButton extends StatelessWidget {
  const ChangeThemeIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ThemeViewModel>().isDarkMode;
    return IconButton.filledTonal(
      onPressed: () {
        context.read<ThemeViewModel>().changeTheme();
      },
      icon: Icon(
        isDarkMode ? Icons.light_mode : Icons.dark_mode,
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int counter = context.watch<CounterViewModel>().counter;
    return Text(
      counter.toString(),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 80,
      ),
    );
  }
}
