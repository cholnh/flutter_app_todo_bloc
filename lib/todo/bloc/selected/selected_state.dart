import 'package:flutter_app_todo_bloc/todo/domain/domain.dart';

abstract class SelectedState {
  const SelectedState();
}

// 여러 개의 노드 선택
class SelectedMany extends SelectedState {
  final List<TodoDto> todos;
  const SelectedMany([this.todos = const []]);

  @override
  String toString() {
    return 'SelectedMany{todos: $todos}';
  }
}

// 단 한 개의 노드 선택
class SelectedOnlyOne extends SelectedState {
  final TodoDto todo;
  const SelectedOnlyOne(this.todo);

  @override
  String toString() {
    return 'SelectedOnlyOne{todo: $todo}';
  }
}

// 선택된 노드 없음
class SelectedNothing extends SelectedState {

  @override
  String toString() {
    return 'SelectedNothing{}';
  }
}