import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TODOItem extends StatelessWidget {
  final String toDoTask;
  late final bool Value;
  Function(bool?)? onTap;
  bool checked;
  final textDecoration;
  final int index;
  final deleteFunction;

  TODOItem({
    required this.toDoTask,
    required this.Value,
    this.onTap,
    required this.checked,
    this.textDecoration,
    required this.index,
    this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slidable(
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                autoClose: true,
                onPressed: deleteFunction,
                icon: Icons.delete,
                backgroundColor: Colors.red.shade500,
                borderRadius: BorderRadius.circular(5.0),
              )
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Checkbox(
                  checkColor: Colors.black,
                  activeColor: Colors.yellow.shade200,
                  value: Value,
                  onChanged: onTap,
                ),
                Text(
                  toDoTask,
                  style: TextStyle(
                    decoration: textDecoration,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
