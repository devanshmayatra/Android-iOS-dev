import 'package:flutter/material.dart';
import 'package:local_storage_todo_app/modules/todo/view/all_todo_screen.dart';
import 'package:local_storage_todo_app/modules/todo/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

class AllTodoProvider extends StatelessWidget {
  const AllTodoProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoViewModel(),
      child: const AllTodoScreen(),
    );
  }
}
