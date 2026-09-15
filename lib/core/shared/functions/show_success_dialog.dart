import 'package:flutter/material.dart';

Future<void> showSuccessDialog(
  BuildContext context,
) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Success'),
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