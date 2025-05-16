import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    useMaterial3: false,
    primaryColor: Colors.teal,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.teal,
      elevation: 0,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.teal,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(backgroundColor: Colors.amber),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.teal,
      elevation: 10,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: Colors.teal,
        shadowColor: Colors.teal,
        elevation: 2,

      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: Colors.teal,
      floatingLabelStyle: const TextStyle(color: Colors.black45),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black45),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black45),
        borderRadius: BorderRadius.circular(15),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
    ),
  );
}
