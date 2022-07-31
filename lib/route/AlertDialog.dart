import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/models/todoModel.dart';

import '../controller/controllerRiverpod.dart';

final riverpodProvider = Provider((ref) => Controller());

alertDialogMethod(context, Function() callback) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return MyAlertDialog(
        callback: callback,
      );
    },
  );
}

class MyAlertDialog extends StatelessWidget {
  //const MyAlertDialog(  {Key? key}) : super(key: key);

  final Function() callback;

  MyAlertDialog({required this.callback});

  @override
  Widget build(
    BuildContext context,
  ) {
    // final controller = ref.watch(riverpodProvider);
    return AlertDialog(
      title: const Text("Delete Task?"),
      actions: [
        TextButton(
          onPressed: callback,
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
