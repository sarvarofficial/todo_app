import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoProgress extends StatelessWidget {

   final List<TodoModel> rejalar;



  TodoProgress(this.rejalar   );

  @override
  Widget build(BuildContext context) {
    var reja= rejalar.length;
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly  ,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text( reja<10 ?"0 $reja":reja.toString() ,style: TextStyle(fontWeight: FontWeight.bold),),
            Text("Barcha reajalaringiz",style: TextStyle(color: Colors.black54),)
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text( rejalar.where((todo) => todo.isDone).length<10 ? "0 ${rejalar.where((todo) => todo.isDone).length}":rejalar.where((todo) => todo.isDone).length.toString() ,style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Bajarilgan reajalaringiz",style: TextStyle(color: Colors.black54),)
          ],
        )
      ],
    );
  }
}
