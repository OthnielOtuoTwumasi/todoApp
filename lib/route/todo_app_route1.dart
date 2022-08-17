import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todoapp/models/todo_app_model.dart';
import 'package:todoapp/controller/todo_app_controller.dart';
import 'package:todoapp/route/todo_app_alert_dialog.dart';

import 'todo_app_task_tile.dart';

class TodoAppRoute1 extends ConsumerStatefulWidget {
  const TodoAppRoute1({Key? key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends ConsumerState<TodoAppRoute1> {
  TextEditingController todoTitle = TextEditingController();
  TextEditingController todoTask = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    todoTitle.dispose();
    todoTask.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final todoAppController = ref.watch(todoAppNotifier);
    final controllerTodoApp = ref.watch(todoAppNotifier.notifier);

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
                        controller: todoTitle,
                        style: const TextStyle(
                          color: Colors.yellow,
                        ),
                        decoration: const InputDecoration(
                          hintText: "Title:",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        textCapitalization: TextCapitalization.sentences,
                        controller: todoTask,
                        style: const TextStyle(
                          color: Colors.yellow,
                        ),
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
                            controllerTodoApp.addtotaskList(
                                title: todoTitle.text,
                                task: todoTask.text,
                                isChecked: false);
                            Navigator.pop(context);
                            todoTitle.clear();
                            todoTask.clear();
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
                itemCount: todoAppController.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onLongPress: () {

                          alertDialogMethod(
                            context,
                            () {
                             Navigator.pop(context);
                              controllerTodoApp.removefromTask(
                                todoAppController[index],
                              );

                            },
                          );

                    },
                    child: TodoAppTaskTile(
                        title: todoAppController[index].title,
                        task: todoAppController[index].task,
                        // checkbox: Checkbox(
                        //     value:
                        //     onChanged: (bool? value) {

                        //       });
                        //     }),
                        checkedValue: todoAppController[index].isChecked,
                        checked: () {
                          todoAppController[index].isChecked
                              ? todoAppController[index].isChecked = false
                              : todoAppController[index].isChecked = false;
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
