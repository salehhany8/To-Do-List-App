import 'package:flutter/material.dart';
import 'package:todo_list_app/core/data/models/task_data_model.dart';
import 'package:todo_list_app/core/forms/update_task_form.dart';

Future<void> showEditTaskDialog({
  required BuildContext context,
  required TaskDataModel task,
}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return UpdateTaskForm(task: task);
    },
  );
}