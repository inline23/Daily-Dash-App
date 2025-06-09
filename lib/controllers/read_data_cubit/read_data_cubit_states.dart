import 'package:daily_dash_app/features/home/models/project_model.dart';

abstract class ReadDataCubitStates {}

class ReadDataCubitInitialState extends ReadDataCubitStates {}

class ReadDataCubitLoadingState extends ReadDataCubitStates {}

class ReadDataCubitSuccessState extends ReadDataCubitStates {
  final List<ProjectModel> models;
  ReadDataCubitSuccessState({required this.models});
}

class ReadDataCubitFailureState extends ReadDataCubitStates {
  final String message;
  ReadDataCubitFailureState({required this.message});
}
