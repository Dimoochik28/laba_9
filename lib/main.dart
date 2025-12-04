import 'package:flutter/material.dart';
import 'package:laba_8/pages/home.dart';

void main() => runApp(
  MaterialApp(
    theme: ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        labelStyle: TextStyle(color: Colors.deepOrange),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange, width: 2),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepOrange,
        ),
      ),
    ),
    home: Home(),
  ),
);
