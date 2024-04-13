import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme._();

  static final ThemeData customTheme = ThemeData(
    useMaterial3: false,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
    ),
  );
}
