import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color color;

  const MyButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 1,
      color: color,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
