import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  // final int maxLine;
  final TextEditingController controller;
  final bool obscureText;
  // String initialValue;
  final String? Function(String?)? onValidate;
  // void Function(String)? onChange;
  final void Function(String?)? onSave;
  // Widget suffixIcon;
  // bool isSuffix;
  final Widget? prefix;
  // final InputDecoration? decoration;
  final TextInputType keyboardType;
  TextFieldWidget(
      {required this.hintText,
      required this.controller,
      // required this.decoration,
      //  required this.maxLine,
      required this.onSave,
      required this.prefix,
      required this.onValidate,
      required this.keyboardType,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSave,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
      ),
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: onValidate,
    );
  }
}
