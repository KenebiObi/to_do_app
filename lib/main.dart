import 'package:hive_flutter/hive_flutter.dart';
import 'home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  // initialise the hive database
  Hive.initFlutter();

  // open a hive database
  var box = Hive.openBox('myBox');

  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
