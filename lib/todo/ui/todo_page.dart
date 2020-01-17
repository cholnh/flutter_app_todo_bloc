import 'package:flutter/material.dart';
import 'package:flutter_app_todo_bloc/todo/ui/todo_detail_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app_todo_bloc/todo/bloc/bloc.dart';
import 'todo_item.dart';
import 'package:flutter_app_todo_bloc/todo/repository/repository.dart';
import 'package:flutter_app_todo_bloc/todo/service/service.dart';

class TodoPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TodoPageState();

  TodoPage({Key key, this.title}) : super(key: key);

  final String title;
}

class _TodoPageState extends State<TodoPage> {

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<TodoBloc>(context);
    print('[Debug] _TodoPageState build [bloc : $_bloc (&${_bloc.hashCode}), state : ${_bloc.state}]');
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.file_download),
              onPressed: () => _bloc.add(LoadTodo()),
              tooltip: 'Load',
            ),
          ],
        ),
        body: BlocBuilder<TodoBloc, TodoState>(
          bloc: _bloc,
          builder: (context, snapshot) {
            return Center(
              child: _drawListViewWidget(_bloc, snapshot),
            );
          }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) {
                return BlocProvider<TodoBloc>(
                  create: (context) => _bloc,
                  child: TodoDetailPage(isAddMode: true),
                );
              }),
            );
          },
          tooltip: 'Load',
          child: Icon(Icons.add),
        ),
      );
  }

  Widget _drawListViewWidget(_bloc, snapshot) {
    print('[Debug] _TodoPageState._drawListViewWidget snapshot: $snapshot');
    if(snapshot is TodoLoaded) {
      var todos = snapshot.todos;
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final todo = todos[index];
          return TodoItem(
            todo: todo,
            onDismissed: (direction) {
              _bloc.add(DeleteTodo(todo));
            },
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) {
                  print('[Debug] _TodoPageState.MaterialPageRoute return before');
                  return BlocProvider<TodoBloc>(
                    create: (context) => _bloc,
                    child: TodoDetailPage(todo: todo, isAddMode: false),
                  );
                }),
              );
            },
            onCheckboxChanged: (_) {
              _bloc.add(
                UpdateTodo(todo.copyWith(completed: !todo.completed)),
              );
            },
          );
        },
        itemCount: todos.length,
      );
    } else if(snapshot is TodoLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if(snapshot is TodoNotLoaded) {
      return Center(
        child: Text('Todo Not Loaded'),
      );
    } else {
      return Text('$snapshot');
    }
  }
}