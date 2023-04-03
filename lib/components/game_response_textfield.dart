import 'package:flutter/material.dart';

class GameResponseTextField extends StatefulWidget {
  final String message;
  final String buttonText;
  final VoidCallback onPressed;

  const GameResponseTextField({
    Key? key,
    required this.message,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  _GameResponseTextFieldState createState() => _GameResponseTextFieldState();
}

class _GameResponseTextFieldState extends State<GameResponseTextField> {
  late String message;
  late String buttonText;
  late VoidCallback onPressed;

  @override
  void initState() {
    super.initState();
    message = widget.message;
    buttonText = widget.buttonText;
    onPressed = widget.onPressed;
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _dialogBuilder(context));
  }

  Future<void> _dialogBuilder(BuildContext context) async {
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
    return Container();
  }
}
