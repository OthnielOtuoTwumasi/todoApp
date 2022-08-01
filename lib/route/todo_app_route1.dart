import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/controller/controllerRiverpod.dart';

import 'package:todoapp/route/todo_alert_dialog.dart';

import 'todo_task_tile.dart';

class Todo_App_Route1 extends ConsumerStatefulWidget {
  const Todo_App_Route1({Key? key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends ConsumerState<Todo_App_Route1> {
  TextEditingController todo_title = TextEditingController();
  TextEditingController todo_task = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    todo_title.dispose();
    todo_task.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todo_app_controller = ref.watch(riverpodProvider);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8, 20, 8, 5),
                      child: Text(
                        "Let's Get Productive",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.yellow,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        textCapitalization: TextCapitalization.sentences,
                        controller: todo_title,
                        style: const TextStyle(color: Colors.yellow),
                        decoration: const InputDecoration(hintText: "Title:"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        textCapitalization: TextCapitalization.sentences,
                        controller: todo_task,
                        style: const TextStyle(color: Colors.yellow),
                        decoration: const InputDecoration(
                          hintText: "Task:",
                        ),
                        maxLines: 3,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(
                          () {
                            todo_app_controller.addtotaskList(
                              title: todo_title.text,
                              task: todo_task.text,
                              isChecked: false,
                            );
                            Navigator.pop(context);
                            //print(Controller().taskList.last);
                          },
                        );
                      },
                      child: const Text("Add Task"),
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            "TASKS",
          ),
        ),
        backgroundColor: Colors.grey[900],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: todo_app_controller.taskList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onLongPress: () {
                      setState(
                        () {
                          alertDialogMethod(
                            context,
                            () {
                              setState(
                                () {
                                  Navigator.pop(context);
                                  todo_app_controller.removefromTask(
                                      task:
                                          todo_app_controller.taskList[index]);
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Todo_Task_Tile(
                        title: todo_app_controller.taskList[index].title,
                        task: todo_app_controller.taskList[index].task,
                        // checkbox: Checkbox(
                        //     value:
                        //     onChanged: (bool? value) {

                        //       });
                        //     }),
                        checkedValue:
                            todo_app_controller.taskList[index].isChecked,
                        checked: () {
                          todo_app_controller.taskList[index].isDone();
                        }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
