import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:to_do/src/bloc/login%20bloc/login_bloc.dart';
import 'package:to_do/src/presentation/screens/welcome_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Laza Ecommerce"), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginInitial) {
                return Form(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: state.nameController,
                          decoration: InputDecoration(label: Text("Name")),
                        ),

                        TextFormField(
                          controller: state.emailController,
                          decoration: InputDecoration(label: Text("Email")),
                        ),
                        TextFormField(
                          controller: state.passwordController,
                          decoration: InputDecoration(label: Text("Password")),
                        ),
                      ],
                    ),
                  ),
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
                MaterialPageRoute(builder: (context) => WelcomeScreen()),
              );
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
