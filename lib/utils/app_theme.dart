import 'package:flutter/material.dart';

class AppTheme {
  static const Color backgroundColor = Color(0xFFB8E9FC);
  static const Color primaryColor = Color(0xFF037AA8);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;

  static ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: whiteColor),
        titleTextStyle: TextStyle(
          color: whiteColor,
          fontSize: 20,
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: primaryColor,
        textTheme: ButtonTextTheme.primary,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: whiteColor,
      ),
      iconTheme: const IconThemeData(color: blackColor),
      textTheme: const TextTheme(
        bodySmall: TextStyle(color: blackColor,fontSize: 16),
        bodyMedium: TextStyle(color: blackColor),
        headlineMedium: TextStyle(color: backgroundColor),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: const OutlineInputBorder(
          borderSide:BorderSide.none,
        ),
        labelStyle: const TextStyle(color: blackColor),
        hintStyle: const TextStyle(color: whiteColor),
      ),
      cardColor: primaryColor,
    );
  }
}
