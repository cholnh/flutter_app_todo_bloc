import 'package:flutter_app_todo_bloc/todo/domain/domain.dart';
import 'package:flutter_app_todo_bloc/todo/repository/repository.dart';
import 'package:flutter_app_todo_bloc/todo/service/todo_service.dart';
import 'package:meta/meta.dart';

class TodoServiceImpl implements TodoService {
  final TodoMemoryRepositoryImpl todoRepository;

  TodoServiceImpl({@required this.todoRepository});

  @override
  Future<List<TodoDto>> getAll() async {
    List<Todo> entities = await todoRepository.getAll();
    return TodoDto.fromEntities(entities);
  }

  @override
  Future<bool> insert(TodoDto dto) {
    return todoRepository.insert(dto.toEntity());
  }

  @override
  Future<bool> update(TodoDto dto) {
    return todoRepository.update(dto.toEntity());
  }

  @override
  Future<bool> delete(TodoDto dto) {
    return todoRepository.delete(dto.toEntity());
  }
}