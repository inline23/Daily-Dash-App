import 'package:daily_dash_app/controllers/read_data_cubit/read_data_cubit_states.dart';
import 'package:daily_dash_app/features/home/models/project_model.dart';
import 'package:daily_dash_app/hive_constatns.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class ReadDataCubit extends Cubit<ReadDataCubitStates> {
  static get(context) => BlocProvider.of(context);

  ReadDataCubit() : super(ReadDataCubitInitialState());

  final Box _box = Hive.box(HiveConstatns.projectsBox);

  void getMethod() {
    emit(ReadDataCubitLoadingState());
    try {
      List<ProjectModel> projectsToReturn =
          List.from(
            _box.get(HiveConstatns.projectsList, defaultValue: []),
          ).cast<ProjectModel>();
      emit(ReadDataCubitSuccessState(models: projectsToReturn));
    } catch (e) {
      emit(
        ReadDataCubitFailureState(
          message: "We have problem at get Please try again",
        ),
      );
    }
  }
}
