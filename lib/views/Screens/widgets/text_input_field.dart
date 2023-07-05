import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String labelText;
  final bool isHide;
  TextInputField(
      {super.key,
      required this.controller,
      required this.icon,
      required this.labelText,
      this.isHide = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isHide,
      decoration: InputDecoration(
        icon: Icon(icon),
        labelText: labelText,
        // labelStyle: TextStyle(color: buttonColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: borderColor),
        ),
      ),
    );
  }
}
