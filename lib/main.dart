import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo_bloc/todo/bloc/bloc.dart';
import 'package:flutter_app_todo_bloc/todo/bloc/simple_bloc_delegate.dart';
import 'package:flutter_app_todo_bloc/todo/repository/repository.dart';
import 'package:flutter_app_todo_bloc/todo/service/service.dart';
import 'package:flutter_app_todo_bloc/todo/ui/todo_detail_page.dart';
import 'package:flutter_app_todo_bloc/todo/ui/todo_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  print('[Debug] runApp!');
  MyApp myApp = MyApp();
  runApp(
      BlocProvider<TodoBloc>(
        create: (context) {
          return TodoBloc(
              todoService: TodoServiceImpl(
                  todoRepository: TodoMemoryRepositoryImpl())
          );
        },
        child:  myApp),
      );
  print('[Debug] runApp end');
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print('[Debug] MyApp build');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
      //home: TodoPage(title: 'Flutter Todo Bloc'),
      debugShowCheckedModeBanner: false,
    );
  }
}