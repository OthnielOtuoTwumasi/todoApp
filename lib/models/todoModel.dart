class TodoModel{
  String title;
  String task;
  bool isChecked;


  TodoModel({required this.title, required this.task,required this.isChecked});

 void isDone(){
    isChecked = !isChecked;
  }
}