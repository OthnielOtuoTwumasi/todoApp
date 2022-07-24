import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
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
              TaskTile(title: "Pray",task: "pray at 6 am",),
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
