import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../controller/controllerRiverpod.dart';

final riverpodProvider = Provider((ref) => controller_with_riverpod());

alertDialogMethod(context, Function() callback) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Todo_Alert_Dialog(
        callback: callback,
      );
    },
  );
}

class Todo_Alert_Dialog extends StatelessWidget {
  //const MyAlertDialog(  {Key? key}) : super(key: key);

  final Function() callback;

  Todo_Alert_Dialog({required this.callback});

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
