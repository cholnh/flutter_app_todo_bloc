import 'package:flutter_app_todo_bloc/todo/domain/domain.dart';

abstract class TodoState {
  const TodoState();
}

class TodoLoading extends TodoState {

  @override
  String toString() {
    return 'TodoLoading{}';
  }
}

class TodoLoaded extends TodoState {
  final List<TodoDto> todos;
  const TodoLoaded([this.todos = const []]);

  @override
  String toString() {
    return 'TodoLoaded{todos: $todos}';
  }
}

class TodoNotLoaded extends TodoState {

  @override
  String toString() {
    return 'TodoNotLoaded{}';
  }
}