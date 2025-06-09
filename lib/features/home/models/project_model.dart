import 'package:daily_dash_app/features/home/models/task_model.dart';

class ProjectModel {
  final int projectId;
  final String projectTitle;
  final String projectDescription;
  final List<String> teamMembers;
  final List<TaskModel> allTasks;

  ProjectModel({
    required this.projectId,
    required this.projectTitle,
    required this.projectDescription,
    this.teamMembers = const [],
    this.allTasks = const [],
  });

  ProjectModel addTeamMember(String memberName) {
    List<String> newMembers = [];
    newMembers = List.from(teamMembers);
    newMembers.add(memberName);
    return ProjectModel(
      projectId: projectId,
      projectTitle: projectTitle,
      projectDescription: projectDescription,
      teamMembers: newMembers,
      allTasks: allTasks,
    );
  }

  ProjectModel addTask(String taskTitle) {
    List<TaskModel> newTasks = [];
    newTasks = List.from(allTasks);
    newTasks.add(TaskModel(taskTitle: taskTitle, isDone: false));
    return ProjectModel(
      projectId: projectId,
      projectTitle: projectTitle,
      projectDescription: projectDescription,
      teamMembers: teamMembers,
      allTasks: newTasks,
    );
  }

  ProjectModel decrementIndexAtDatabase() {
    return ProjectModel(
      projectId: projectId - 1,
      projectTitle: projectTitle,
      projectDescription: projectDescription,
    );
  }

  ProjectModel deleteTask(int indexAtTasks) {
    List<ProjectModel> newTasks = [];
    newTasks = List.from(allTasks);
    newTasks.removeAt(indexAtTasks);
    return decrementIndexAtDatabase();
  }
}
