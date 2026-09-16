import 'package:flutter/material.dart';
import 'package:todo_list_app/core/style/color_manager.dart';

Future<void> showSuccessDialog(
  BuildContext context,
) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Success',style: TextStyle(color:ColorManager.brandPrimaryColor)),
        content: const Text(
          'Task added successfully',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}