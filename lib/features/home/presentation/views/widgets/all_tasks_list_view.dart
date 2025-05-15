import 'package:daily_dash_app/core/utils/styles.dart';
import 'package:daily_dash_app/features/home/domain/entities/to_do.dart';
import 'package:daily_dash_app/features/home/presentation/views/widgets/to_do_item.dart';
import 'package:flutter/material.dart';

class AllTasksListView extends StatelessWidget {
  const AllTasksListView({
    super.key,
    required this.tasks,
    required this.onDelete,
  });

  final List<ToDo> tasks;
  final Function(ToDo) onDelete;

  bool get isEmpty => tasks.isEmpty;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? const Column(
          children: [
            const SizedBox(height: 50),
            Center(
              child: Text(
                "No tasks yet",
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        )
        : ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tasks.length,
          itemBuilder:
              (context, index) => ToDoItem(
                task: tasks[index],
                onDelete: () => onDelete(tasks[index]),
              ),
        );
  }
}
