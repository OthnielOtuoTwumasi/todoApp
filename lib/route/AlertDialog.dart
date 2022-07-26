import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/models/todoModel.dart';

import '../controller/controllerRiverpod.dart';

final riverpodProvider = Provider((ref) => Controller());

// void alertDialogMethod(context, TodoModel todoModel) {
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return MyAlertDialog(
//           title: titleM,
//           task: taskM,
//         );
//       });
// }

class MyAlertDialog extends StatefulWidget {
  //const MyAlertDialog(  {Key? key}) : super(key: key);

  final Function() callback;

  MyAlertDialog({required this.callback});

  @override
  State<MyAlertDialog> createState() => _AlertDialogState();
}

class _AlertDialogState extends State<MyAlertDialog> {
  @override
  Widget build(
    BuildContext context,
  ) {
    // final controller = ref.watch(riverpodProvider);
    return AlertDialog(
      title: const Text("Delete Task?"),
      actions: [
        TextButton(
          onPressed: widget.callback,
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
