import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo.dart';

import '../models/todo_model.dart';

class TodoPage extends StatelessWidget {
  final List<TodoModel> rejalar;
  final Function markDone;
  final Function todoDelete;

  TodoPage(this.rejalar, this.markDone, this.todoDelete, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: rejalar.length>0 ? ListView.builder(
          itemCount: rejalar.length,
          itemBuilder: (context, index) {
            return Todo(rejalar[index], markDone, todoDelete);
          })
          :Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text("Sizda hozircha rejalar yo'q",style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 32,),
          Image.asset("assets/images/sleep.png",
            fit: BoxFit.cover,
            width: 200,
          ),
        ],
      )

    );
  }
}
