import 'package:flutter/material.dart';

class GameTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;

  const GameTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.text,
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          cursorColor: Colors.lightBlue,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: controller.clear,
              icon: const Icon(Icons.clear),
            ),
            contentPadding: const EdgeInsets.all(20.0),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightBlue),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightBlue.shade400),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500])),
        ),
      ),
    );
  }
}
