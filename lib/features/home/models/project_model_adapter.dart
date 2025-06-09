import 'package:daily_dash_app/features/home/models/project_model.dart';
import 'package:daily_dash_app/features/home/models/task_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProjectModelAdapter extends TypeAdapter<ProjectModel> {
  @override
  read(BinaryReader reader) {
    return ProjectModel(
      projectId: reader.readInt(),
      projectTitle: reader.readString(),
      projectDescription: reader.readString(),
      teamMembers: reader.readList().cast<String>(),
      allTasks: reader.readList().cast<TaskModel>(),
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, ProjectModel obj) {
    writer.writeInt(obj.projectId);
    writer.writeString(obj.projectTitle);
    writer.writeString(obj.projectDescription);
    writer.writeString(obj.projectDescription);
    writer.writeList(obj.teamMembers);
    writer.writeList(obj.allTasks);
  }
}
