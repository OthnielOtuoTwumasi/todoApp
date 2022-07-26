import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoapp/models/todoModel.dart';
class Controller extends ChangeNotifier{
  final List<TodoModel> _tasks = [
     TodoModel(task: "Pray at 4pm", title: "Pray"),

   ];
   UnmodifiableListView<TodoModel> get taskList {
     return UnmodifiableListView(_tasks);
}

 void addtotaskList({required String title, required  task}){
     final add = TodoModel(title: title, task: task);
   _tasks.add(add);
     notifyListeners();
     print(taskList.length);
 }



}