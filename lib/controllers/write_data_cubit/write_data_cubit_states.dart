abstract class WriteDataCubitStates {}

class WriteDataCubitInitialState extends WriteDataCubitStates {}

class WriteDataCubitLoadingState extends WriteDataCubitStates {}

class WriteDataCubitSuccessState extends WriteDataCubitStates {}

class WriteDataCubitFailureState extends WriteDataCubitStates {
  final String message;
  WriteDataCubitFailureState({required this.message});
}
