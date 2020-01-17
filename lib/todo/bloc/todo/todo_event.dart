import 'package:flutter_app_todo_bloc/todo/domain/domain.dart';

abstract class TodoEvent {
  const TodoEvent();
}

class LoadTodo extends TodoEvent {
}

class InsertTodo extends TodoEvent {
  final TodoDto todo;
  const InsertTodo(this.todo);
}

class UpdateTodo extends TodoEvent {
  final TodoDto todo;
  const UpdateTodo(this.todo);
}

class DeleteTodo extends TodoEvent {
  final TodoDto todo;
  const DeleteTodo(this.todo);
}