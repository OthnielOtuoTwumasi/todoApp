import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/models/todo_app_model.dart';

class _TodoAppController extends StateNotifier<List<TodoAppModel>> {
  _TodoAppController()
      : super(
          [],
        );

  void addtotaskList({required title, required task, required isChecked}) {
    state = state
      ..add(
        TodoAppModel(title: title, task: task, isChecked: isChecked),
      );
  }

  void removefromTask(TodoAppModel todoModel) {
    state = state.where((element) => todoModel != element).toList();
  }

// void updateCheckbox(TodoModel todoModel) {
//   [state]
// }
}

final StateNotifierProvider<_TodoAppController, List<TodoAppModel>>
    todoAppNotifier = StateNotifierProvider(
  (ref) => _TodoAppController(),
);

// class TodoAppController extends ChangeNotifier {
//   final riverpodProvider = Provider((ref) => TodoAppController());
//   final List<Todo_Model> _tasks = [
//     Todo_Model(task: "Pray at 4pm", title: "Pray", isChecked: false),
//   ];
//
//   UnmodifiableListView<Todo_Model> get taskList {
//     return UnmodifiableListView(_tasks);
//   }
//
//   void addtotaskList({required title, required task, required isChecked}) {
//     final add = Todo_Model(title: title, task: task, isChecked: isChecked);
//     _tasks.add(add);
//     notifyListeners();
//   }
//
//   void removefromTask({required Todo_Model task}) {
//     _tasks.remove(task);
//     notifyListeners();
//   }
//   void update(Todo_Model todoModel){
//     todoModel.isDone();
//     notifyListeners();
//   }
//
//
// }
