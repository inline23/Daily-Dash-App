import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import '../../features/home/domain/entities/project_entity.dart';
import '../../features/home/domain/entities/to_do.dart';

class HiveConfig {
  static Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final hivePath = path.join(appDocumentDir.path, 'hive');

    await Hive.initFlutter(hivePath);

    // Register adapters
    Hive.registerAdapter(ProjectEntityAdapter());
    Hive.registerAdapter(ToDoAdapter());

    // Open boxes
    await Hive.openBox<ProjectEntity>('projects');
  }
}
