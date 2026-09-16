import 'package:flutter/material.dart';
import 'package:todo_list_app/core/style/color_manager.dart';

Future<void> showErrorDialog(
  BuildContext context, {
  required String errorMessage,
}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Error',style: TextStyle(color:ColorManager.errorDefaultColor)),
        content: Text(errorMessage),
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