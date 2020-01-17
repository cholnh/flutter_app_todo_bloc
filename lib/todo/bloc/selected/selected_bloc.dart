import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app_todo_bloc/todo/bloc/selected/selected_state.dart';
import 'package:flutter_app_todo_bloc/todo/domain/domain.dart';
import '../bloc.dart';

class SelectedBloc extends Bloc<SelectedEvent, SelectedState> {

  @override
  SelectedState get initialState => SelectedNothing();

  @override
  Stream<SelectedState> mapEventToState(SelectedEvent event) async* {
    if(event is Selected) {
      TodoDto selectedTodo = event.selectedTodo;

      if(state is SelectedNothing) {
        yield SelectedOnlyOne(selectedTodo);
      } else if(state is SelectedOnlyOne) {
        yield SelectedMany([]
          ..add((state as SelectedOnlyOne).todo)
          ..add(selectedTodo));
      } else if(state is SelectedMany) {
        yield SelectedMany(
          (state as SelectedMany).todos
          ..add(selectedTodo));
      }
    } else if(event is UnSelected){
      TodoDto unSelectedTodo = event.unSelectedTodo;

      if(state is SelectedOnlyOne) {
        yield SelectedNothing();
      } else if(state is SelectedMany) {
        List<TodoDto> dtos = (state as SelectedMany).todos;
        if(dtos.length == 2) {
          yield SelectedOnlyOne(dtos
            .where((dto) => dto.id != unSelectedTodo.id)
            .single
          );
        } else {
          yield SelectedMany(dtos
            .where((dto) => dto.id != unSelectedTodo.id)
            .toList()
          );
        }
      }
    }
  }
}