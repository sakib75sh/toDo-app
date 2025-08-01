import 'package:hive_flutter/adapters.dart';

class TodoDatabase {
  List todoList = [];

  // referance out box

  final myBox = Hive.box("myBox");

  // run this method if this is the first time ever opening the app
  void createInitialData() {
    todoList = [
      ['Make Tutorial', 'Submition Date', false],
    ];
  }

  // load the data from database
  void loadData() {
    todoList = myBox.get("TODOLIST");
  }

  // up date data
  void updateData() {
    myBox.put("TODOLIST", todoList);
  }
}
