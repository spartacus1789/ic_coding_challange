import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.deepPurple,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.white,
      secondary: Colors.red,
    ),
    cardTheme: const CardTheme(
      color: Colors.teal,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white54,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 28,
      ),
      labelMedium: TextStyle(
        color: Colors.grey,
        fontSize: 15,
      ),
      titleSmall: TextStyle(
        fontSize: 15,
      ),
    ),
  );
}
