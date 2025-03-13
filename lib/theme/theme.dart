import 'package:flutter/material.dart';

class AppTheme {
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 0, 230, 118),
      Color.fromARGB(255, 0, 204, 255),
      Color.fromARGB(255, 47, 158, 255),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 47, 158, 255),
      Color.fromARGB(255, 0, 204, 255),
      Color.fromARGB(255, 0, 230, 118),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static ThemeData lightTheme = ThemeData(
    primaryColor: Color.fromARGB(255, 0, 204, 255),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
