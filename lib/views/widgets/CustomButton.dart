import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomButon extends StatelessWidget {
  final Function()? onPressed;
  final Color bgColor;
  final String txt;
  final TextStyle? textStyle;
  const CustomButon({
    super.key,
    required this.onPressed,
    required this.txt,
    this.bgColor = Colors.black,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
        ),
        child: Text(
          txt,
          style: textStyle,
        ),
      ),
    );
  }
}
