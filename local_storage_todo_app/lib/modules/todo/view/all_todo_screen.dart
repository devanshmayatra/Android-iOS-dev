import 'package:flutter/material.dart';
import 'package:local_storage_todo_app/modules/todo/view/create_todo_screen.dart';
import 'package:local_storage_todo_app/modules/todo/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

import 'widgets/all_todo_list_builder.dart';

class AllTodoScreen extends StatelessWidget {
  const AllTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Create'),
        onPressed: () {
          _navigateToCreateTodoScreen(context);
        },
        icon: const Icon(Icons.add),
      ),
      body: const AllTodoListBuilder(),
    );
  }

  void _navigateToCreateTodoScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (newContext) => ChangeNotifierProvider.value(
          value: context.read<TodoViewModel>(),
          child: const CreateTodoScreen(),
        ),
      ),
    );
  }
}
