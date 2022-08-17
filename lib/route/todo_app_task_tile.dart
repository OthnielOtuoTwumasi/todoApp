import 'package:flutter/material.dart';


class TodoAppTaskTile extends StatelessWidget {
  // const taskTile({
  //   Key? key,
  // }) : super(key: key);
  final String title;
  final String task;
  final bool checkedValue;
  final Function() checked;

  TodoAppTaskTile({
    required this.title,
    required this.task,
    required this.checkedValue,
    required this.checked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 15,
            spreadRadius: 1,
            offset: Offset(4, 4),
          ),
          BoxShadow(
            color: Colors.black,
            blurRadius: 15,
            spreadRadius: 1,
            offset: Offset(-4, -4),
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
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
                    color: Colors.yellow[600],
                  ),
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
          // Checkbox(
          //   value: checkedValue,
          //   onChanged: checked(),
          // ),
        ],
      ),
    );
  }
}
