import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: Colors.yellow)),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.grey[900],
      titleTextStyle: const TextStyle(color: Colors.white),
      contentTextStyle: const TextStyle(color: Colors.white),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    ),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(foregroundColor: Colors.black),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.grey[850]),
    textTheme: const TextTheme(
      bodyText2: TextStyle(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow, onPrimary: Colors.black),
    ),
  );
}
