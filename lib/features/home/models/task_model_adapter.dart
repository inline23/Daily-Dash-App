import 'package:daily_dash_app/features/home/models/task_model.dart';
import 'package:hive/hive.dart';

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  final int typeId = 1;

  @override
  TaskModel read(BinaryReader reader) {
    return TaskModel(taskTitle: reader.readString(), isDone: reader.readBool());
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer.writeBool(obj.isDone);
    writer.writeString(obj.taskTitle);
  }
}
