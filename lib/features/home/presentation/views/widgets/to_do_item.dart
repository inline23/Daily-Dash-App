import 'package:daily_dash_app/core/utils/styles.dart';
import 'package:daily_dash_app/features/home/domain/entities/to_do.dart';
import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({super.key, required this.task, required this.onDelete, required this.onToggleCompletion});

  final ToDo task;
  final VoidCallback onDelete;
  final VoidCallback onToggleCompletion;

  bool get completed => task.isDone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        color: const Color(0xFF263238),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(task.title, style: TextStyle(color: Colors.white)),
            Row(
              children: [
                Container(
                  child: IconButton(
                    onPressed: onDelete,
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  decoration: BoxDecoration(color: primaryColor),
                  child:
                      completed
                          ? IconButton(
                            onPressed: onToggleCompletion,
                            icon: Icon(Icons.check_box_rounded),
                          )
                          : IconButton(
                            onPressed: onToggleCompletion,
                            icon: Icon(Icons.check_box_outline_blank_outlined),
                          ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
