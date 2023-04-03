import 'package:flutter/material.dart';

Future<void> dialogBuilder(
    {required BuildContext context,
    required message,
    required buttonText,
    required onPressed}) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const SizedBox.shrink(),
        content: Text(message),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.bodyLarge,
            ),
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      );
    },
  );
}
