import 'package:hive/hive.dart';

part 'task_entity.g.dart';

@HiveType(typeId: 0)
class TaskEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String status;
  @HiveField(4)
  final String dueDate;
  @HiveField(5)
  final List<String> teamMembers;

  TaskEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.dueDate,
    required this.teamMembers,
  });
}
