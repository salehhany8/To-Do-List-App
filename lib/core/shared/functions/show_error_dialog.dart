import 'package:flutter/material.dart';

Future<void> showErrorDialog(
  BuildContext context, {
  required String errorMessage,
}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Error'),
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