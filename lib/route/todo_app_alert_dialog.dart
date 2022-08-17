import 'package:flutter/material.dart';

alertDialogMethod(context, Function() callback) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return TodoAppAlertDialog(
        callback: callback,
      );
    },
  );
}

class TodoAppAlertDialog extends StatelessWidget {
  //const MyAlertDialog(  {Key? key}) : super(key: key);

  final Function callback;

  TodoAppAlertDialog({required this.callback});

  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
      title: const Text("Delete Task?"),
      actions: [
        TextButton(
          onPressed: callback(),
          child: const Text("Yes"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("No"),
        ),
      ],
      content: const Text("Are you sure you want to delete this task?"),
    );
  }
}
