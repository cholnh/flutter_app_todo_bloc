import 'package:flutter_app_todo_bloc/todo/repository/todo_repository.dart';
import 'package:flutter_app_todo_bloc/todo/domain/domain.dart';

class TodoMemoryRepositoryImpl implements TodoRepository {

  final List<Todo> list = new List();

  TodoMemoryRepositoryImpl() {
    Todo todo1 = Todo(
        userId: 1, id: 123, title: 'test title1', completed: true);
    list.add(todo1);
    Todo todo2 = Todo(
        userId: 2, id: 345, title: 'test title2', completed: false);
    list.add(todo2);
    Todo todo3 = Todo(
        userId: 3, id: 567, title: 'test title3', completed: true);
    list.add(todo3);
  }

  @override
  Future<List<Todo>> getAll() async {
    return list;
  }

  @override
  Future<bool> insert(Todo entity) {
    list.add(entity);
  }

  @override
  Future<bool> update(Todo entity) {
    for(var todo in list) {
      if(todo.id == entity.id) {
        list[list.indexOf(todo)] = entity;
        break;
      }
    }
  }

  @override
  Future<bool> delete(Todo entity) {
    for(var todo in list) {
      if(todo.id == entity.id) {
        list.remove(todo);
        print('deleted! : $todo');
        break;
      }
    }
    print(list);
  }

}

void main() async {

  // init test
  TodoMemoryRepositoryImpl todoRepositoryImpl = new TodoMemoryRepositoryImpl();
  var todoList;
  await todoRepositoryImpl.getAll().then((todos) => todoList = todos);
  print(todoList);

  // update test
  Todo todo1 = Todo(userId: 1, id: 123, title: 'test title!!!!', completed: false);
  todoRepositoryImpl.update(todo1);
  await todoRepositoryImpl.getAll().then((todos) => todoList = todos);
  print(todoList);

  // insert test
  Todo todo2 = Todo(userId: 3, id: 2000, title: 'hellow', completed: false);
  todoRepositoryImpl.insert(todo2);
  await todoRepositoryImpl.getAll().then((todos) => todoList = todos);
  print(todoList);

  // delete test
  todoRepositoryImpl.delete(todo2);
  await todoRepositoryImpl.getAll().then((todos) => todoList = todos);
  print(todoList);


}