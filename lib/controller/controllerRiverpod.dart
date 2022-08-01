import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoapp/models/todo_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class controller_with_riverpod extends ChangeNotifier {
  final riverpodProvider = Provider((ref) => controller_with_riverpod());
  final List<Todo_Model> _tasks = [
    Todo_Model(task: "Pray at 4pm", title: "Pray", isChecked: false),
  ];

  UnmodifiableListView<Todo_Model> get taskList {
    return UnmodifiableListView(_tasks);
  }

  void addtotaskList({required title, required task, required isChecked}) {
    final add = Todo_Model(title: title, task: task, isChecked: isChecked);
    _tasks.add(add);
    notifyListeners();
  }

  void removefromTask({required Todo_Model task}) {
    _tasks.remove(task);
    notifyListeners();
  }
  void update(Todo_Model todoModel){
    todoModel.isDone();
    notifyListeners();
  }


}
