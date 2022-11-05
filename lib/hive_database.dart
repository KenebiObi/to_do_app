import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/widgets/to_do_task_tile.dart';

class HiveDatabase {
  final mybox = Hive.box("mybox");

  // An empty list of my todo tasks where other tasks will be added
  List<TODOItem> to_do_items = <TODOItem>[];

  // data seen when app is opened for the first time
  void initialTasks() {
    to_do_items = [
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
  }

//   // load the data from the database if there are tasks
//   void loadExistingData() {
//     to_do_items = mybox.get("TODOTASKS");
//   }

//   // add data to the database
//   void addData(){
//      mybox.put("TODOTASKS", to_do_items);
//   }
}
