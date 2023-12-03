import 'package:flutter/material.dart';

class Themes {
  Themes._();

  static final light = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      shape: Border(bottom: BorderSide(color: Colors.black)),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      onPrimary: Colors.black,
      surfaceTint: Colors.transparent,
    ),
    dividerTheme: const DividerThemeData(color: Colors.black26),
    drawerTheme: const DrawerThemeData(width: 200),
    dialogTheme: const DialogTheme(
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(color: Colors.black),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero)),
      hintStyle: TextStyle(color: Colors.black26),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 20, color: Colors.black),
      titleMedium: TextStyle(fontSize: 18, color: Colors.black),
    ),
    listTileTheme: const ListTileThemeData(
      subtitleTextStyle: TextStyle(color: Colors.black, fontSize: 14),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      shape: CircleBorder(),
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      shape: Border(bottom: BorderSide(color: Colors.white54)),
    ),
    colorScheme: const ColorScheme.dark(
      primary: Colors.blue,
      onPrimary: Colors.white,
      surface: Colors.black,
      surfaceTint: Colors.transparent,
    ),
    dividerTheme: const DividerThemeData(color: Colors.white24),
    drawerTheme: const DrawerThemeData(width: 200),
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(color: Colors.white),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero)),
      hintStyle: TextStyle(color: Colors.white24),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 20),
      titleMedium: TextStyle(fontSize: 18),
    ),
    listTileTheme: const ListTileThemeData(
      subtitleTextStyle: TextStyle(fontSize: 14),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      shape: CircleBorder(),
    ),
  );
}
