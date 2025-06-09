import 'package:daily_dash_app/controllers/write_data_cubit/write_data_cubit_states.dart';
import 'package:daily_dash_app/features/home/models/project_model.dart';
import 'package:daily_dash_app/hive_constatns.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class WriteDataCubit extends Cubit<WriteDataCubitStates> {
  WriteDataCubit() : super(WriteDataCubitInitialState());

  static WriteDataCubit get(context) => BlocProvider.of(context);

  final Box box = Hive.box(HiveConstatns.projectsBox);

  String title = '';
  String description = '';

  void updateTitle(String title) {
    this.title = title;
  }

  void updateDescription(String description) {
    this.description = description;
  }

  void addProject() {
    _tryAndCatchBlock(() {
      List<ProjectModel> projects = _getProjectsFromDatabase();
      projects.add(
        ProjectModel(
          projectId: projects.length,
          projectTitle: title,
          projectDescription: description,
        ),
      );
      box.put(HiveConstatns.projectsList, projects);
    }, 'We have problems when we add Project , Please try again');
  }

  void deleteProject(int indexAtDatabase) {
    _tryAndCatchBlock(() {
      List<ProjectModel> projects = _getProjectsFromDatabase();
      projects.removeAt(indexAtDatabase);
      for (var i = indexAtDatabase; i < projects.length; i++) {
        projects[i] = projects[i].decrementIndexAtDatabase();
      }
      box.put(HiveConstatns.projectsList, projects);
    }, 'We have problems when we delete Project , Please try again');
  }

  List<ProjectModel> _getProjectsFromDatabase() =>
      List.from(
        box.get(HiveConstatns.projectsList, defaultValue: []),
      ).cast<ProjectModel>();

  void _tryAndCatchBlock(VoidCallback methodToExcute, String message) {
    emit(WriteDataCubitLoadingState());
    try {
      methodToExcute.call();
      emit(WriteDataCubitSuccessState());
    } catch (e) {
      emit(WriteDataCubitFailureState(message: message));
    }
  }

  void addTask(int indexAtDatabase) {
    _tryAndCatchBlock(() {
      List<ProjectModel> projects = _getProjectsFromDatabase();
      projects[indexAtDatabase] = projects[indexAtDatabase].addTask(title);
      box.put(HiveConstatns.projectsList, projects);
    }, "We have problems when we addTask  , Please try again");
  }

  void deleteTask(int indexAtDatabase, int indexAtTasks) {
    _tryAndCatchBlock(() {
      List<ProjectModel> projects = _getProjectsFromDatabase();
      projects[indexAtDatabase].deleteTask(indexAtTasks);
      box.put(HiveConstatns.projectsList, projects);
    }, "We have problems when we deleteTask  , Please try again");
  }
}
