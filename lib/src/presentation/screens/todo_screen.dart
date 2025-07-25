import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do/src/Database/todo_database.dart';

import 'package:to_do/src/presentation/widgets/dialog_box.dart';
import 'package:to_do/src/presentation/widgets/todo_tile.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  //

  // referance the hive box

  final myBox = Hive.box("myBox");

  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    // if this is the first time poening the app, then create default data

    if (myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there already exist data
      db.loadData();
    }

    super.initState();
  }

  // // Todo list
  // List todoList = [
  //   // ["Make tutorial", false],
  //   // ["Run", false],
  // ];

  // checkBox change
  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });

    db.updateData();
  }

  // create new task

  final newTaskName = TextEditingController();

  void creatNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          textContrller: newTaskName,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // Save New Task

  void saveNewTask() {
    setState(() {
      db.todoList.add([newTaskName.text, false]);
    });
    newTaskName.clear(); // textForm কে clear করার জন্য
    Navigator.of(context).pop();
    db.updateData();
  }

  // delete Task

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ToDo"), centerTitle: true),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.todoList[index][0],
            completed: db.todoList[index][1],
            onChanged: (value) => checkboxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // focusColor: Colors.amberAccent,
        // hoverColor: Colors.amberAccent,
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.black,
        onPressed: creatNewTask,
        child: Icon(Icons.add, size: 30),
      ),
    );
  }
}
