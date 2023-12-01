import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith();

  static final dark = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      shape: Border(
        bottom: BorderSide(
          color: Colors.white54,
        ),
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: Colors.blue,
      surface: Colors.black,
      surfaceTint: Colors.transparent,
    ),
    scaffoldBackgroundColor: Colors.black,
    dividerTheme: const DividerThemeData(
      color: Colors.white24,
    ),
  );
}
