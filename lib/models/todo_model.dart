class Todo_Model {
  String title;
  String task;
  bool isChecked;

  Todo_Model(
      {required this.title, required this.task, required this.isChecked});

  void isDone() {
    isChecked = !isChecked;
  }
}
