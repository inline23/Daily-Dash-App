class ProjectModel {
  int projectId;
  String projectName;
  String descreption;
  DateTime dateTime;
  List<String> tasksIds;

  ProjectModel({
    required this.projectId,
    required this.projectName,
    required this.descreption,
    required this.dateTime,
    required this.tasksIds,
  });

  
}
