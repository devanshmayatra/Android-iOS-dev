import 'package:flutter/material.dart';
import 'package:local_storage_todo_app/modules/todo/view/all_todo_provider.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      home: const AllTodoProvider(),
    );
  }
}
