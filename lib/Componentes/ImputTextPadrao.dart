import 'package:flutter/material.dart';

class ImputTextPadrao extends StatelessWidget {
  const ImputTextPadrao({
    Key key,
    @required this.label,
    @required this.controller,
    this.validator = true,
    this.obscureText = false,
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  final validator;
  final obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: label),
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 25.0),
      controller: controller,
      validator: validator,
    );
  }
}
