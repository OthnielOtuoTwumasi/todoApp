import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/controller/controllerRiverpod.dart';
import 'package:todoapp/models/modalSheet.dart';
import 'package:todoapp/route/AlertDialog.dart';

import '../models/TaskTile.dart';

final riverpodProvider = Provider((ref) => Controller());

class TodoApp extends ConsumerStatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends ConsumerState<TodoApp> {
  TextEditingController title = TextEditingController();
  TextEditingController task = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    title.dispose();
    task.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(riverpodProvider);
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
                        controller: title,
                        style: const TextStyle(color: Colors.yellow),
                        decoration: const InputDecoration(hintText: "Title:"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        textCapitalization: TextCapitalization.sentences,
                        controller: task,
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
                            controller.addtotaskList(
                              title: title.text,
                              task: task.text,
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
                itemCount: controller.taskList.length,
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
                                  controller.removefromTask(
                                      task: controller.taskList[index]);
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                    child: TaskTile(
                      title: controller.taskList[index].title,
                      task: controller.taskList[index].task,
                      // checkbox: Checkbox(
                      //     value:
                      //     onChanged: (bool? value) {

                      //       });
                      //     }),
                      checkedValue: controller.taskList[index].isChecked,
                      checked: () {
                        setState(
                          () {
                            controller.taskList[index].isDone();
                          },
                        );
                      },
                    ),
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
