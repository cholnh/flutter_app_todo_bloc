import 'package:flutter/material.dart';
import 'package:flutter_app_todo_bloc/todo/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app_todo_bloc/todo/bloc/bloc.dart';

class TodoDetailPage extends StatelessWidget {
  final bool isAddMode;
  final TodoDto todo;
  final TextEditingController _textEditingController1 = new TextEditingController();
  final TextEditingController _textEditingController2 = new TextEditingController();
  final TextEditingController _textEditingController3 = new TextEditingController();

  TodoDetailPage({Key key, this.todo, @required this.isAddMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _bloc = BlocProvider.of<TodoBloc>(context);
    print('[Debug] TodoDetailPage build');
        return Scaffold(
          appBar: AppBar(
            title: Text(
                isAddMode
                ? 'New Todo'
                : todo.title
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Padding(
                    padding: EdgeInsets.only(right: 12),
                    child:
                    Text(
                      'edit',
                      style: TextStyle(fontSize: 13),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 12),
                    child:
                    RaisedButton(
                      child: Text(
                        'delete',
                        style: TextStyle(fontSize: 13),),
                    )
                      //onPressed: () => _bloc.add(DeleteTodo(todo))),
                  ),
                ],
              ),
            ],
          ),
          body: IconTheme(
            data: IconThemeData(color: Theme.of(context).accentColor),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      controller: _textEditingController1,
                      decoration: new InputDecoration(
                          hintText: !isAddMode
                              ? '${todo.userId}'
                              : 'User Id',
                          //labelText: 'User Id'
                      ),
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: _textEditingController2,
                      decoration: new InputDecoration(
                          hintText: !isAddMode
                              ? '${todo.id}'
                              : 'Id',
                          //labelText: 'Id'
                      ),
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: _textEditingController3,
                      decoration: new InputDecoration(
                          hintText: !isAddMode
                              ? '${todo.title}'
                              : 'Title',
                          //labelText: 'Title'
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Text(
                      isAddMode
                          ? 'New Todo'
                          : todo.completed
                            ? 'Completed'
                            : 'ImCompleted',
                      style: TextStyle(fontSize: 15)
                  ),
                ],
              )
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
            },
            tooltip: 'Load',
            child: Icon(Icons.add),
          ),
        );
  }

}