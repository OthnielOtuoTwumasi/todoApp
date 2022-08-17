import 'package:flutter/material.dart';

class ToDoAppThemeData {
  ThemeData themeData = ThemeData(
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.yellow.shade600,
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.grey.shade900,
      titleTextStyle: TextStyle(
        color: Colors.yellow.shade600,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
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
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
      backgroundColor: Colors.yellow.shade600,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.grey.shade900,
    ),
    textTheme: const TextTheme(
      bodyText2: TextStyle(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow.shade600, onPrimary: Colors.black),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: const CircleBorder(),
      fillColor: MaterialStateProperty.all(Colors.yellow.shade600),
      checkColor: MaterialStateProperty.all(Colors.black),
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
        color: Colors.yellow.shade600,
      ),
    ),
  );
}
