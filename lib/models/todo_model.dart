class TodoModel {
  final String id;
  final String name;
  final DateTime day;
  bool isDone = false;

  TodoModel(
      {required this.id, required this.day, required this.name, required});

  Changedone() {
    isDone = !isDone;
  }
}

class Todos {
  List<TodoModel> _list = [
    TodoModel(
      id: "1",
      day: DateTime.now(),
      name: "Flutterni o'rganish",
    ),
    TodoModel(
      id: "2",
      day: DateTime.now(),
      name: "Kitob o'qish",
    ),
    TodoModel(
      id: "3",
      day: DateTime.now(),
      name: "Dalada ishlash",
    ),
  ];

  List<TodoModel> get todoList {
    return _list;
  }

  void todoAdd(String todoName, DateTime todoDay) {
    _list.add(
        TodoModel(id: "r${_list.length + 1}", day: todoDay, name: todoName));
  }

  List<TodoModel> todoByDay(DateTime date) {
    return _list
        .where((todo) =>
            todo.day.day == date.day &&
            todo.day.month == date.month &&
            todo.day.year == date.year)
        .toList();
  }
}
