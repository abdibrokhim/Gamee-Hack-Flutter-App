import 'package:flutter/material.dart';

class GameResponseTextField extends StatelessWidget {
  final String message;
  final String buttonText;
  final VoidCallback onPressed;

  const GameResponseTextField({
    Key? key,
    required this.message,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  Future<void> _dialogBuilder(BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _dialogBuilder(context);
      },
      child: Container(),
    );
  }
}
