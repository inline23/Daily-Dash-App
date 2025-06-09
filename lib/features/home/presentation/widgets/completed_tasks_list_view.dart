import 'package:daily_dash_app/core/utils/styles.dart';
import 'package:daily_dash_app/features/home/presentation/widgets/completed_task_item.dart';
import 'package:flutter/material.dart';

class CompletedTasksListView extends StatelessWidget {
  const CompletedTasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // set a fixed height
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          if (index == 0) {
            return CompletedTaskItem(
              bgColor: primaryColor,
              textColor: Colors.black,
            );
          } else {
            return CompletedTaskItem(
              bgColor: Color(0xFF455A64),
              textColor: Colors.white,
            );
          }
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
