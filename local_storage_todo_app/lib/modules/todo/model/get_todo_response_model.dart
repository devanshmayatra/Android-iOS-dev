import 'package:local_storage_todo_app/modules/todo/model/todo_model.dart';

class GetTodoResponseModel {
  final List<TodoModel> todos;
  final int total;

  const GetTodoResponseModel({
    required this.todos,
    required this.total,
  });
}
