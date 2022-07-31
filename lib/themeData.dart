import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: Colors.yellow[600]),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.grey[900],
      titleTextStyle: TextStyle(
          color: Colors.yellow[600], fontWeight: FontWeight.w600, fontSize: 20),
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
      backgroundColor: Colors.yellow[600],
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.grey[850],
    ),
    textTheme: const TextTheme(
      bodyText2: TextStyle(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow[600], onPrimary: Colors.black),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: const CircleBorder(),
      fillColor: MaterialStateProperty.all(Colors.yellow[600]),
      checkColor: MaterialStateProperty.all(Colors.black),
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
          color: Colors.yellow[600]),
    ),
  );
}
