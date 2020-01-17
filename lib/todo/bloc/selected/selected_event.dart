import 'package:flutter_app_todo_bloc/todo/domain/domain.dart';

abstract class SelectedEvent {
  const SelectedEvent();
}

class Selected extends SelectedEvent {
  final TodoDto selectedTodo;
  const Selected(this.selectedTodo);
}

class UnSelected extends SelectedEvent {
  final TodoDto unSelectedTodo;
  const UnSelected(this.unSelectedTodo);
}