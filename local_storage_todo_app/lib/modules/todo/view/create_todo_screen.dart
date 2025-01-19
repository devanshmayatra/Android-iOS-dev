import 'package:flutter/material.dart';
import 'package:local_storage_todo_app/modules/todo/view/widgets/todo_category_builder.dart';
import 'package:local_storage_todo_app/modules/todo/view/widgets/todo_priority_builder.dart';
import 'package:local_storage_todo_app/modules/todo/view/widgets/todo_status_builder.dart';
import 'package:local_storage_todo_app/modules/todo/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

import 'widgets/create_todo_loader_overlay.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Create todo'),
          ),
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        hintText: 'Enter title',
                      ),
                      maxLength: 100,
                      validator: (input) {
                        if (input == null) return 'Title is required';
                        if (input.trim().isEmpty) return 'Title is required';
                        if (input.trim().length < 5) {
                          return 'Minimum 5 characters are required';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        hintText: 'Enter description',
                      ),
                      maxLines: 5,
                      maxLength: 500,
                    ),
                    const SizedBox(height: 16),
                    const TodoCategoryBuilder(),
                    const SizedBox(height: 16),
                    const TodoPriorityBuilder(),
                    const SizedBox(height: 16),
                    const TodoStatusBuilder(),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: () {
                        _onSaveButtonTapEvent(context);
                      },
                      child: const Text('Save'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        const CreateTodoLoaderOverlay(),
      ],
    );
  }

  void _onSaveButtonTapEvent(BuildContext context) {
    if (formKey.currentState?.validate() == true) {
      context.read<TodoViewModel>().createTodoEvent(
            title: titleController.text.trim(),
            description: descriptionController.text.trim().isNotEmpty
                ? descriptionController.text.trim()
                : null,
            onCompleted: (result) {
              Navigator.of(context).pop(result);
            },
          );
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
