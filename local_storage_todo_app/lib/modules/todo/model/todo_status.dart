enum TodoStatus {
  pending,
  completed,
}

TodoStatus mapToTodoStatus(String name) {
  switch (name) {
    case 'pending':
      return TodoStatus.pending;
    case 'completed':
      return TodoStatus.completed;
    default:
      return TodoStatus.pending;
  }
}

String mapFromTodoStatus(TodoStatus todoStatus) {
  switch (todoStatus) {
    case TodoStatus.pending:
      return 'pending';
    case TodoStatus.completed:
      return 'completed';
    default:
      return 'pending';
  }
}
