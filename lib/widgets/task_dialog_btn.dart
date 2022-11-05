import 'package:flutter/material.dart';

class TaskDialogButton extends StatelessWidget {
  final color;
  final btnTextColor;
  final tapped;
  final String text;
  const TaskDialogButton(
      {super.key, required this.color, required this.btnTextColor, this.tapped, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      onPressed: tapped,
      child: Text(
        text,
        style: TextStyle(color: btnTextColor),
      ),
    );
  }
}
