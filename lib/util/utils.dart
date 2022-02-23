import 'package:flutter/material.dart';

class Utils {

  static TextStyle style = const TextStyle(
      fontFamily: 'Gujarati',
      fontSize: 20.0,
      color: Colors.grey
  );

  static UnderlineInputBorder border = const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
  );

  static TextFormField createTextField(String text, bool obscureText) => TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
    controller: TextEditingController(),
    obscureText: obscureText,
    decoration: InputDecoration(
      hintText: text,
      hintStyle: style,
      enabledBorder: border,
      focusedBorder: border,
    ),
  );
}