import 'package:flutter/material.dart';

class MyThemes {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    primarySwatch: Colors.red,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),
    ),
  );

  static ThemeData get darkTheme => ThemeData(brightness: Brightness.dark);
}
