abstract class HomeState {}

//creation
class InitialTaskCreationState extends HomeState {}

class LoadingCreationState extends HomeState {}

class SuccessCreationState extends HomeState {}

class FailedToCteateState extends HomeState {
  final String errorMessage;

  FailedToCteateState({required this.errorMessage});
}

//getting
class InitialTaskGettingState extends HomeState {}

class LoadingGettingState extends HomeState {}

class SuccessGettingState extends HomeState {}

class EmptyTasksState extends HomeState {}

class FailedToGetState extends HomeState {
  final String errorMessage;

  FailedToGetState({required this.errorMessage});
}

//update
class InitialTaskUpdateState extends HomeState {}

class LoadingTaskUpdateState extends HomeState {}

class SuccessTaskUpdateState extends HomeState {}

class FailedToUpdateState extends HomeState {
  final String errorMessage;

  FailedToUpdateState({
    required this.errorMessage,
  });
  
}


//delete

class InitialTaskDeleteState extends HomeState {}

class LoadingTaskDeleteState extends HomeState {}

class SuccessTaskDeleteState extends HomeState {}

class FailedToDeleteState extends HomeState {
  final String errorMessage;

  FailedToDeleteState({
    required this.errorMessage,
  });
}