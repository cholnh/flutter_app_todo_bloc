import 'package:flutter_app_todo_bloc/todo/domain/domain.dart';

abstract class TodoRepository {
  Future<List<Todo>> getAll();

  Future<bool> insert(Todo entity);

  Future<bool> update(Todo entity);

  Future<bool> delete(Todo entity);

}