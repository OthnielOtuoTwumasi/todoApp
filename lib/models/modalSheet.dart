// import 'package:flutter/material.dart';
// import 'package:todoapp/controller/controllerRiverpod.dart';
// import 'package:todoapp/route/Route1.dart';
//
//   modalSheetMethod(context ){
//    return ;
//   }
//
// class ModalSheet extends StatefulWidget {
//   const ModalSheet({Key? key}) : super(key: key);
//
//   @override
//   State<ModalSheet> createState() => _ModalSheetState();
// }
//
// class _ModalSheetState extends State<ModalSheet> {
//   TextEditingController title = TextEditingController();
//   TextEditingController task = TextEditingController();
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     title.dispose();
//     task.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TextField(
//             controller: title,
//             decoration: const InputDecoration(hintText: "Title:"),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TextField(
//             controller: task,
//             decoration: const InputDecoration(
//               hintText: "Task:",
//             ),
//             maxLines: 3,
//           ),
//         ),
//         ElevatedButton(
//           onPressed: () {
//            setState(() {
//              Controller().addtotaskList(title: title.text, task: task.text);
//              Navigator.pop(context);
//              print(Controller().taskList);
//
//            });
//           },
//           child: const Text("Add Task"),
//         ),
//       ],
//     );
//
//   }
// }
