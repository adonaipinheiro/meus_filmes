import 'package:flutter/material.dart';

class TextInputCustom extends StatelessWidget {
  const TextInputCustom({
    Key? key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff8c59a4))),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff8c59a4))),
      ),
    );
  }
}
