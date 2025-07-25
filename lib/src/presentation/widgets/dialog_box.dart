import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import 'package:to_do/src/presentation/widgets/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController textContrller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  // final void Function()? onSave;
  // final void Function()? onCancel;
  const DialogBox({
    super.key,
    required this.textContrller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(2),
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.amberAccent,
        ),
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // user input
              TextField(controller: textContrller),

              Gap(20),
              // cancel or save button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButton(
                    color: const Color.fromARGB(255, 235, 197, 58),
                    text: "Save",
                    onPressed: onSave,
                  ),
                  MyButton(
                    color: const Color.fromARGB(255, 235, 197, 58),
                    text: "Cancel",
                    onPressed: onCancel,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
