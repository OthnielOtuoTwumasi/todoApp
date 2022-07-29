import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoapp/models/todoModel.dart';

class Controller extends ChangeNotifier {
  final List<TodoModel> _tasks = [
    TodoModel(task: "Pray at 4pm", title: "Pray", isChecked: false),
  ];

  UnmodifiableListView<TodoModel> get taskList {
    return UnmodifiableListView(_tasks);
  }

  void addtotaskList({required title, required task, required isChecked}) {
    final add = TodoModel(title: title, task: task, isChecked: isChecked);
    _tasks.add(add);
    notifyListeners();
  }

  void removefromTask({required TodoModel task}) {
    _tasks.remove(task);
    notifyListeners();
  }
  void update(TodoModel todoModel){
    todoModel.isDone();
    notifyListeners();
  }


}
