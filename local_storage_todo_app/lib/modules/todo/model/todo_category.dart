enum TodoCategory { personal, work }

TodoCategory mapToTodoCategory(String name) {
  switch (name) {
    case 'personal':
      return TodoCategory.personal;
    case 'work':
      return TodoCategory.work;
    default:
      return TodoCategory.personal;
  }
}

String mapFromTodoCategory(TodoCategory todoCategory) {
  switch (todoCategory) {
    case TodoCategory.personal:
      return 'personal';
    case TodoCategory.work:
      return 'work';
    default:
      return 'personal';
  }
}
