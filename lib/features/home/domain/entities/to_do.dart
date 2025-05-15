import 'package:hive/hive.dart';

part 'to_do.g.dart';

@HiveType(typeId: 1)
class ToDo {
  // final String id;
  @HiveField(0)
  final String title;

  @HiveField(1)
  final bool isDone;

  ToDo({required this.title, required this.isDone});
}
