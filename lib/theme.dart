import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
    //Dark Theme
    brightness: Brightness.dark,
    backgroundColor: Colors.black,
    primaryColor: Colors.blue,
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.deepOrange,
        brightness: Brightness.dark,
        backgroundColor: Colors.black),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 30, 34, 39),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.blue,
        textStyle: const TextStyle(fontSize: 16),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(Colors.white),
      fillColor: MaterialStateProperty.all(Colors.blue),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.blue),
    textTheme: const TextTheme(
      labelLarge: TextStyle(fontSize: 20),
      labelMedium: TextStyle(fontSize: 17),
      labelSmall: TextStyle(fontSize: 15),
      titleLarge: TextStyle(fontSize: 25),
      titleMedium: TextStyle(fontSize: 18),
      titleSmall: TextStyle(fontSize: 16),
      bodyLarge: TextStyle(fontSize: 16),
      headlineSmall: TextStyle(
          fontSize: 22, color: Colors.white, fontWeight: FontWeight.w300),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
    ),
  );
}
