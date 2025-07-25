import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:to_do/src/bloc/login%20bloc/login_bloc.dart';
import 'package:to_do/src/presentation/screens/todo_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginInitial) {
                return Center(
                  child: Text('Hello,${state.nameController.text}'),
                );
              } else {
                return Container();
              }
            },
          ),
          Gap(150),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TodoScreen()),
              );
            },
            child: Text("proceed"),
          ),
        ],
      ),
    );
  }
}
