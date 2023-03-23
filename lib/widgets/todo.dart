import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';

class Todo extends StatelessWidget {
  final TodoModel todo;
  final Function markDone;
  final Function todoDelete;

  Todo(this.todo, this.markDone, this.todoDelete, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () {
          markDone(todo.id);
        },
        icon: todo.isDone
            ? Icon(Icons.check_circle_outline)
            : Icon(Icons.circle_outlined),
        color: todo.isDone ? Colors.green : Colors.grey,
      ),
      title: Text(
        "${todo.name}",
        style: TextStyle(
            decoration:
                todo.isDone ? TextDecoration.lineThrough : TextDecoration.none,
            color: todo.isDone ? Colors.grey : Colors.black),
      ),
      trailing: IconButton(
        onPressed: () {
          todoDelete(todo.id);
        },
        icon: Icon(Icons.delete),
      ),
    );
  }
}
