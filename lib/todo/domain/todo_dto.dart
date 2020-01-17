import 'package:flutter_app_todo_bloc/todo/domain/todo.dart';

class TodoDto {
  int userId;
  int id;
  String title;
  bool completed;

  TodoDto({this.userId, this.id, this.title, this.completed});

  @override
  String toString() =>
      'TodoDto{userId: $userId, id: $id, title: $title, completed: $completed}';

  Todo toEntity() => Todo(
      userId: userId,
      id: id,
      title: title,
      completed: completed
  );

  static List<Todo> toEntities(List<TodoDto> dtos) => dtos.map((dto) => dto.toEntity()).toList();

  static TodoDto fromEntity(Todo entity) => TodoDto(
      userId: entity.userId,
      id: entity.id,
      title: entity.title,
      completed: entity.completed ?? false,
  );

  static List<TodoDto> fromEntities(List<Todo> entities) => entities.map(fromEntity).toList();

  TodoDto copyWith({int userId, int id, String title, bool completed}) {
    return TodoDto(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}