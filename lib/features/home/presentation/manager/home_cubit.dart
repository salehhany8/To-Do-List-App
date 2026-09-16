import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/core/data/models/task_data_model.dart';
import 'package:todo_list_app/core/utils/firebase/firebase_services.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final FirebaseServices firebaseServices;

  HomeCubit({required this.firebaseServices,}) 
  : super(InitialTaskCreationState());

  Future<void> createTask({required TaskDataModel task,}) 
  async {
    emit(InitialTaskCreationState());
    
    try {
      emit(LoadingCreationState());
      //throw Exception('testing');
      await firebaseServices.createTask(task);
      emit(SuccessCreationState());
    } catch (e) {
      emit(
        FailedToCteateState(
          errorMessage: e.toString(),
        ),
      );
    }
  }


  Stream<List<TaskDataModel>> getTasks() {
  return firebaseServices.getTasks();
}

  Future<void> updateTask({
    required String taskId,
    required TaskDataModel newTask,
  }) async {
    emit(LoadingTaskUpdateState());

    try {
      await firebaseServices.updateTask(
        newTask: newTask,
        taskId: taskId,
      );

      emit(SuccessTaskUpdateState());
    } catch (e) {
      emit(
        FailedToUpdateState(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> deleteTask({
  required String taskId,
}) async {
  emit(LoadingTaskDeleteState());

  try {
    await firebaseServices.deleteTask(
      taskId: taskId,
    );

    emit(SuccessTaskDeleteState());
  } catch (e) {
    emit(
      FailedToDeleteState(
        errorMessage: e.toString(),
      ),
    );
  }
}
 
}
