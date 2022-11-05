import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/task_dialog_btn.dart';

class NewTaskDialog extends StatelessWidget {
  final textController;
  final save;
  final cancel;
  final String firstBtnText;
  final String secondBtnText;
  final Color btnColor;
  final Color btnTextColor;
  final txtFieldChanged;
  const NewTaskDialog({
    super.key,
    required this.textController,
    required this.save,
    required this.cancel,
    required this.firstBtnText,
    required this.secondBtnText,
    required this.btnColor,
    required this.btnTextColor,
    required this.txtFieldChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      title: TextFormField(
        controller: textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {  txtFieldChanged;
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 11.0, right: 11.0, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TaskDialogButton(
                tapped: save,
                text: firstBtnText,
                // color:Colors.yellow,
                color: btnColor,
                btnTextColor: btnTextColor,
              ),
              TaskDialogButton(
                tapped: cancel,
                text: secondBtnText,
                btnTextColor: Colors.yellow,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ],
    );
    ;
  }
}
