import 'package:flutter_app_todo_bloc/todo/repository/todo_repository.dart';
import 'package:flutter_app_todo_bloc/todo/domain/domain.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TodoHttpRepositoryImpl implements TodoRepository {

  final http.Client _client = http.Client();
  final _url = 'https://jsonplaceholder.typicode.com/todos';

  @override
  Future<List<Todo>> getAll() async {
    final response = await _client.get(_url);

    if (response.statusCode == 200) {
      List<Todo> entities = [];
      json.decode(response.body)
          .forEach((map) => entities.add(Todo.fromJson(map)));

      return entities;
    } else {
      throw Exception('TodoRepositoryImpl.getAll() : 데이터 통신 에러');
    }
  }

  @override
  Future<bool> insert(Todo entity) {

  }

  @override
  Future<bool> update(Todo entity) {

  }

  @override
  Future<bool> delete(Todo entity) {

  }

}