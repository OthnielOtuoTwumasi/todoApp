import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/controller/controllerRiverpod.dart';
import 'package:todoapp/models/modalSheet.dart';

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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: title,
                            decoration:
                                const InputDecoration(hintText: "Title:"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: task,
                            decoration: const InputDecoration(
                              hintText: "Task:",
                            ),
                            maxLines: 3,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {

                             setState(() {
                               controller.addtotaskList(
                                   title: title.text, task: task.text);
                               Navigator.pop(context);
                               print(Controller().taskList.last);
                             });

                          },
                          child: const Text("Add Task"),
                        ),
                      ],
                    );
                  });
            },
            backgroundColor: Colors.yellow[600],
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            title: const Text("TASKS",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0)),
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
                      return TaskTile(
                        title: controller.taskList[index].title,
                        task: controller.taskList[index].task,
                      );
                    }),
              )
            ],
          )),
    );
  }
}

class TaskTile extends StatelessWidget {
  // const taskTile({
  //   Key? key,
  // }) : super(key: key);
  final String title;
  final String task;

  TaskTile({required this.title, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey[900],
          boxShadow: const [
            BoxShadow(
                color: Colors.black,
                blurRadius: 15,
                spreadRadius: 1,
                offset: Offset(4, 4)),
            BoxShadow(
                color: Colors.black,
                blurRadius: 15,
                spreadRadius: 1,
                offset: Offset(-4, -4)),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 10, 2),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.5,
                      color: Colors.yellow[600]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 0, 8),
                child: Text(
                  task,
                  style: const TextStyle(
                      fontSize: 18,
                      //fontWeight: FontWeight.w500,
                      letterSpacing: -0.5),
                ),
              ),
            ],
          ),
          GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 30,
                color: Colors.grey,
              )),
        ],
      ),
    );
  }
}
