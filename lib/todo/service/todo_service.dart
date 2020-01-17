import 'package:flutter_app_todo_bloc/todo/domain/domain.dart';

abstract class TodoService {
  Future<List<TodoDto>> getAll();

  Future<bool> insert(TodoDto entity);

  Future<bool> update(TodoDto entity);

  Future<bool> delete(TodoDto entity);
}