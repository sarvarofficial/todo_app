import 'dart:core';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/todo_model.dart';

import '../widgets/todo_add.dart';
import '../widgets/todo_date.dart';
import '../widgets/todo_page.dart';
import '../widgets/todo_progress.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Todos rejalar = Todos();
  DateTime beldilanganKun = DateTime.now();

  @override
  Widget build(BuildContext context) {
    void selectDate(BuildContext context) {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2022),
              lastDate: DateTime(2024))
          .then((selectedDay) {
        if (selectedDay != null) {
          setState(() {
            beldilanganKun = selectedDay;
          });
        }
      });
    }

    void oldingiSana() {
      setState(() {
        beldilanganKun = DateTime(
            beldilanganKun.year, beldilanganKun.month, beldilanganKun.day + 1);
      });
    }

    void keyingiSana() {
      setState(() {
        beldilanganKun = DateTime(
            beldilanganKun.year, beldilanganKun.month, beldilanganKun.day - 1);
      });
    }

    void markDone(String todoId) {
      setState(() {
        rejalar.todoByDay(beldilanganKun).firstWhere((todo) => todo.id.toString() == todoId).Changedone();
      });
    }

    todoDelete(String todoId) {
      setState(() {
        rejalar.todoList.removeWhere((todo) => todo.id == todoId);
      });
    }

    void AddTodo(String todoName,DateTime todoDay ){
      setState(() {
        rejalar.todoAdd(todoName, todoDay);
      });
      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Todo app"),
      ),
      body: Column(
        children: [
          TodoDate(selectDate, beldilanganKun, oldingiSana, keyingiSana),
          TodoProgress(rejalar.todoByDay(beldilanganKun)),
          TodoPage(
            rejalar.todoByDay(beldilanganKun),
            markDone,
            todoDelete,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
            isDismissible: false,
              context: context,
              builder: (context) {
                return TodoAdd(AddTodo);
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
