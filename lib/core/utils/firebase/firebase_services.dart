// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:todo_list_app/core/data/models/task_data_model.dart';

// class FirebaseServices {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> addTask(TaskDataModel task) async {
//     await _firestore.collection('tasks').add(task.toJson());
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list_app/core/data/models/task_data_model.dart';
import 'package:todo_list_app/core/utils/constants.dart';

class FirebaseServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createTask(TaskDataModel task) async {
    final CollectionReference<TaskDataModel> collection =
        _firestore
            .collection(Constants.firebaseTasksCollection)
            .withConverter<TaskDataModel>(
              fromFirestore: (snapshot, options) {
                return TaskDataModel.fromJson(
                  snapshot.data() ?? {},
                );
              },
              toFirestore: (task, options) {
                return task.toJson();
              },
            );

    final DocumentReference<TaskDataModel> docRef =
        collection.doc();

    task.id = docRef.id;

    await docRef.set(task);
  }

  Stream<List<TaskDataModel>> getTasks() {
  return _firestore
      .collection(Constants.firebaseTasksCollection)
      .withConverter<TaskDataModel>(
        fromFirestore: (snapshot, options) {
          final task = TaskDataModel.fromJson(
            snapshot.data() ?? {},
          );

          task.id = snapshot.id;

          return task;
        },
        toFirestore: (task, options) {
          return task.toJson();
        },
      )
      .snapshots()
      .map(
        (snapshot) => snapshot.docs
            .map((doc) => doc.data())
            .toList(),
      );
  }
  

  Future<void> updateTaskStatus({
    required String taskId,
    required bool isDone,
  }) async {
    await _firestore
        .collection(Constants.firebaseTasksCollection)
        .doc(taskId)
        .update({
          'isDone': isDone,
        });
  }

  Future<void> updateTask({
    required String taskId,
    required TaskDataModel newTask,
  }) async {
    await _firestore
        .collection(Constants.firebaseTasksCollection)
        .doc(taskId)
        .update(
          newTask.toJson(),
        );
  }

  Future<void> deleteTask({
  required String taskId,
}) async {
  await _firestore
      .collection(Constants.firebaseTasksCollection)
      .doc(taskId)
      .delete();
}
}



