import 'package:daily_dash_app/features/home/domain/entities/project_entity.dart';
import 'package:daily_dash_app/features/home/domain/entities/to_do.dart';
import 'package:daily_dash_app/features/home/presentation/views/widgets/ongoing_item.dart';
import 'package:flutter/material.dart';

class OngoingListView extends StatelessWidget {
  OngoingListView({super.key});

  List<ProjectEntity> projects = [
    ProjectEntity(
      id: '1',
      title: 'Add Project Logic',
      description: 'Description 1',
      status: 'Ongoing',
      dueDate: '12/5/2025',
      toDos: [
        ToDo(
          title: 'To Do 1',
          isDone: false,
        ),
      ],
      teamMembers: List.empty(),
    ),
    ProjectEntity(
      id: '2',
      title: 'To Do UI',
      description: 'Description 2',
      status: 'Ongoing',
      dueDate: '12/5/2025',
      toDos: [],
      teamMembers: List.empty(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return OnGoingItem(project: projects[index]);
      },
    );
  }
}
