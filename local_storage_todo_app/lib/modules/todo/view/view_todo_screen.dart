import 'package:flutter/material.dart';
import 'package:local_storage_todo_app/modules/todo/model/todo_category.dart';
import 'package:local_storage_todo_app/modules/todo/model/todo_model.dart';
import 'package:local_storage_todo_app/modules/todo/model/todo_priority.dart';
import 'package:local_storage_todo_app/modules/todo/model/todo_status.dart';
import 'package:local_storage_todo_app/modules/todo/view/dialog/todo_dialog_helper.dart';
import 'package:local_storage_todo_app/modules/todo/view/widgets/tags.dart';
import 'package:local_storage_todo_app/modules/todo/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';
import 'widgets/create_todo_loader_overlay.dart';

class ViewTodoScreen extends StatelessWidget {
  const ViewTodoScreen({
    super.key,
    required this.model,
  });

  final TodoModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Todo'),
            actions: [
              IconButton(
                onPressed: () {
                  TodoDialogHelper.showDeleteConfirmationDialog(
                    context,
                    () {
                      context.read<TodoViewModel>().deleteTodoEvent(
                            todo: model,
                            onCompleted: () {
                              Navigator.of(context).pop();
                            },
                          );
                    },
                  );
                },
                icon: const Icon(Icons.delete_outline_rounded),
              ),
              const SizedBox(width: 24),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Tags(
                      tag: mapFromTodoCategory(model.category),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Tags(
                      tag: mapFromTodoPriority(model.priority),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Tags(
                      tag: mapFromTodoStatus(model.status),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  model.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                if (model.description != null)
                  Text(
                    model.description!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
              ],
            ),
          ),
        ),
        const CreateTodoLoaderOverlay(),
      ],
    );
  }
}
