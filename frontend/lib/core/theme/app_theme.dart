
import 'package:flutter/material.dart';

class AppTheme {
  // Main app colors
  static const Color backgroundColor = Color(0xFF10182A);
  static const Color surfaceColor = Color(0xFF1C2940);
  static const Color primaryColor = Color(0xFF3978F6);
  static const Color secondaryColor = Color(0xFF8B9BB8);
  static const Color textColor = Color(0xFFFFFFFF);
  static const Color mutedTextColor = Color(0xFFB6C4DC);

  // Light theme is not needed for our initial design.
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: secondaryColor,
        surface: surfaceColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        elevation: 0,
        centerTitle: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceColor,
        hintStyle: const TextStyle(
          color: mutedTextColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: primaryColor,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
