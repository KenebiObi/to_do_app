import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
import 'package:to_do_app/widgets/task_dialog.dart';
import 'package:to_do_app/widgets/to_do_task_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // make a referenc to the hive database
  // var mybox = Hive.openBox("mybox");

  // An empty list of my todo tasks where other tasks will be added
  List<TODOItem> to_do_items = <TODOItem>[
    TODOItem(
      toDoTask: "Check out the apps functionality",
      Value: false,
      checked: false,
      index: 0,
    ),
    TODOItem(
      toDoTask: "Make your first to do task",
      Value: false,
      checked: false,
      index: 1,
    ),
  ];
  // My text editing controller for the
  // textfield in the alert dialog
  final TextEditingController myTextController = TextEditingController();

  // The alert dialog that will pop up when
  // the floating action button is onTap
  void myAlertDialog() {
    showDialog(
      context: context,
      builder: ((context) {
        return NewTaskDialog(
          txtFieldChanged: (newValue) {
            setState(() {});
          },
          textController: myTextController,
          firstBtnText: "Save",
          save: () {
            Navigator.pop(context);
            setState(() {
              // Add item if text field is not empty
              if (myTextController.text.trim().isNotEmpty) {
                to_do_items.add(
                  TODOItem(
                    checked: false,
                    toDoTask: myTextController.text,
                    Value: false,
                    index: (to_do_items.length - 1) <= 0
                        ? 0
                        : (to_do_items.length - 1),
                    onTap: (newValue) {},
                  ),
                );
              }
              // Else, do nothing
              myTextController.clear();
            });
          },
          btnColor: myTextController.text.trim().isNotEmpty
              ? Colors.yellow
              : Colors.black,
          btnTextColor: myTextController.text.trim().isNotEmpty
              ? Colors.black
              : Colors.yellow,
          secondBtnText: "Cancel",
          cancel: () {
            Navigator.pop(context);
          },
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        elevation: 2.5,
        title: const Text(
          "TO DO",
          style: TextStyle(
            letterSpacing: 2.5,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
                left: 20.0,
                right: 20.0,
              ),
              child: ListView.builder(
                itemCount: to_do_items.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: TODOItem(
                      checked: false,
                      textDecoration: to_do_items[index].checked == true
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      index: (to_do_items.length - 1) <= 0
                          ? 0
                          : (to_do_items.length - 1),
                      Value: to_do_items[index].checked,
                      onTap: (bool? newValue) {
                        setState(() {
                          to_do_items[index].checked = newValue!;
                        });
                      },
                      toDoTask: to_do_items[index].toDoTask,

                      ///Delete to do task
                      deleteFunction: (context) {
                        setState(() {
                          to_do_items.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: myAlertDialog,
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 30.0,
        ),
      ),
    );
  }
}
