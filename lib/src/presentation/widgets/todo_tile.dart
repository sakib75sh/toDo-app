import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do/src/presentation/widgets/notification.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final String inputDate;
  final bool completed;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;
  const TodoTile({
    super.key,
    required this.taskName,
    required this.completed,
    required this.onChanged,
    required this.deleteFunction,
    required this.inputDate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.all(5),

          child: Row(
            children: [
              Checkbox(
                value: completed,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                taskName,
                style: TextStyle(
                  decoration: completed
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              Expanded(child: Container()),
              TextButton(
                onPressed: () {
                  // NotificationServece().scheudleNotification(
                  //   title: taskName,
                  //   body: inputDate,
                  //   hour: 17,
                  //   minute: 08,
                  // );
                  // NotificationServece().scheudleNotification(
                  //   title: taskName,
                  //   body: inputDate,
                  //   hour: 4,
                  //   minute: 49,
                  // );

                  NotificationServece().showNotification(
                    title: taskName,
                    body: inputDate,
                  );
                },
                child: Text("Press for S notification"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
