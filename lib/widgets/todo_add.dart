import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoAdd extends StatefulWidget {
  final Function AddTodo;

  const TodoAdd(this.AddTodo, {Key? key}) : super(key: key);

  @override
  State<TodoAdd> createState() => _TodoAddState();
}

class _TodoAddState extends State<TodoAdd> {
  DateTime? beldilanganKunAdd;

  final AddTodoController = TextEditingController();

  void selectDateAdd(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2024))
        .then((selectedDayAdd) {
      if (selectedDayAdd != null) {
        setState(() {
          beldilanganKunAdd = selectedDayAdd;
        });
      }
    });
  }

  void Submit() {
    if (AddTodoController.text.isEmpty || beldilanganKunAdd == null) {
      return;
    }
    setState(() {
      widget.AddTodo(AddTodoController.text, beldilanganKunAdd);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom > 0
                ? MediaQuery.of(context).viewInsets.bottom
                : MediaQuery.of(context).viewInsets.bottom+160),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: AddTodoController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(beldilanganKunAdd == null
                    ? "Reja kuni tanlanmagan..."
                    : DateFormat("EEEE,d,MMMM,yyyy")
                        .format(beldilanganKunAdd!)),
                TextButton(
                    onPressed: () {
                      selectDateAdd(context);
                    },
                    child: Text("KUNNI TANLASH"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("BEKOR QILISH")),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                ElevatedButton(onPressed: Submit, child: Text("KIRITISH")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
