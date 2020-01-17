import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo_bloc/todo/domain/domain.dart';

class TodoItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final ValueChanged<bool> onCheckboxChanged;
  final TodoDto todo;

  TodoItem({
    Key key,
    @required this.onDismissed,
    @required this.onTap,
    @required this.onCheckboxChanged,
    @required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('__dismissible_'+todo.id.toString()+'__'),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        leading: Checkbox(
          key: Key('__checkbox_'+todo.id.toString()+'__'),
          value: todo.completed,
          onChanged: onCheckboxChanged,
        ),
        title: Hero(
          tag: '${todo.id}__heroTag',
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              todo.title,
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
        subtitle: todo.title.isNotEmpty
            ? Text(
                todo.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subhead,
              )
            : null,
      ),
    );
  }
}