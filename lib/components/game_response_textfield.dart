import 'package:flutter/material.dart';

Future<void> dialogBuilder({
  required BuildContext context,
  required String message,
  required VoidCallback onPressed,
}) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return GestureDetector(
        onTap: () {
          // Dismiss the dialog if the user taps outside of it
          // Navigator.of(context).pop();
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Center(
            child: AlertDialog(
              title: const SizedBox.shrink(),
              content: Text(message),
              contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              actions: [
                Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                    onPressed: onPressed,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Text(
                        "Close",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}


