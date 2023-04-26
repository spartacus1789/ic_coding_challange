import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;
  final Function(String?)? onChange;
  final bool obscureText;
  final String value;
  const CustomTextField({
    super.key,
    required this.controller,
    this.obscureText = false,
    required this.validator,
    required this.onChange,
    this.value = "",
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      onChanged: onChange,
      decoration: const InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.only(left: 15, top: 12, bottom: 12),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.black87,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
