import 'package:flutter/material.dart';
import 'package:local_storage_todo_app/modules/todo/model/todo_status.dart';
import 'package:local_storage_todo_app/modules/todo/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

class TodoStatusBuilder extends StatelessWidget {
  const TodoStatusBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<TodoViewModel>().status;
    return Row(
      children: [
        Text(
          'Status',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Spacer(),
        ...TodoStatus.values.map((status) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InputChip(
              selected: selected == status,
              label: Text(
                status.name,
                style: TextStyle(fontSize: 12),
              ),
              onSelected: (value) {
                _onSelectedEvent(value, context, status);
              },
            ),
          );
        })
      ],
    );
  }

  void _onSelectedEvent(
    bool value,
    BuildContext context,
    TodoStatus status,
  ) {
    if (value) {
      context.read<TodoViewModel>().changeTodoStatusEvent(status);
    }
  }
}
