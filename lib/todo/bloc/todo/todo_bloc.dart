import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app_todo_bloc/todo/service/service.dart';
import 'package:meta/meta.dart';
import '../bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {

  final TodoServiceImpl todoService;

  TodoBloc({@required this.todoService}) {
    print('[Debug] TodoBloc constructor : &$hashCode');
  }

  @override
  TodoState get initialState => TodoLoading();

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    print('[Debug] TodoBloc.mapEventToState event: $event');
    if (event is LoadTodo) {
      yield* _mapLoadTodoToState();
    } else if (event is InsertTodo) {
      yield* _mapInsertTodoToState(event);
    } else if (event is UpdateTodo) {
      yield* _mapUpdateTodoToState(event);
    } else if (event is DeleteTodo) {
      yield* _mapDeleteTodoToState(event);
    }
  }

  Stream<TodoState> _mapLoadTodoToState() async* {
    try {
      print('[Debug] TodoBloc._mapLoadTodoToState state: $state');
      final todos = await todoService.getAll();
      yield TodoLoaded(todos);
    } catch (_) {
      yield TodoNotLoaded();
    }
  }

  Stream<TodoState> _mapInsertTodoToState(InsertTodo event) async* {
    if (state is TodoLoaded) {
      await todoService.insert(event.todo);
      final todos = await todoService.getAll();
      yield TodoLoaded(todos);
    }
  }

  Stream<TodoState> _mapUpdateTodoToState(UpdateTodo event) async* {
    if (state is TodoLoaded) {
      await todoService.update(event.todo);
      final todos = await todoService.getAll();
      yield TodoLoaded(todos);
    }
  }

  Stream<TodoState> _mapDeleteTodoToState(DeleteTodo event) async* {
    print('[Debug] TodoBloc._mapDeleteTodoToState state: $state');
    if (state is TodoLoaded) {
      await todoService.delete(event.todo);
      final todos = await todoService.getAll();
      yield TodoLoaded(todos);
    }
  }
}