import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do/src/bloc/login%20bloc/login_bloc.dart';

// import 'package:to_do/src/presentation/screens/home_screen.dart';
import 'package:to_do/src/presentation/screens/todo_screen.dart';

void main() async {
  //initial the hive

  await Hive.initFlutter();

  // open a box

  // ignore: unused_local_variable
  var box = await Hive.openBox("myBox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<LoginBloc>(create: (context) => LoginBloc())],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: TodoScreen()),
    );
  }
}
