import 'package:flutter/material.dart';
import '../styles/app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppRawColors.primaryDark,
      scaffoldBackgroundColor: AppRawColors.backgroundDark,
      fontFamily: 'NeueMontreal',
      colorScheme: const ColorScheme.dark(
        primary: AppRawColors.primaryDark,
        secondary: AppRawColors.secondaryDark,
        surface: AppRawColors.surfaceDark,
        error: AppRawColors.errorDark,
        onPrimary: AppRawColors.textPrimaryDark,
        onSecondary: AppRawColors.textSecondaryDark,
      ),

      cardColor: AppRawColors.cardDark,
      iconTheme: const IconThemeData(color: AppRawColors.iconDark),

      appBarTheme: const AppBarTheme(
        backgroundColor: AppRawColors.surfaceDark,
        iconTheme: IconThemeData(color: AppRawColors.iconDark),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppRawColors.primaryDark,
          foregroundColor: AppRawColors.backgroundDark,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          elevation: 0,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: AppRawColors.backgroundDark,
          side: BorderSide.none,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppRawColors.surfaceDark,
        hintStyle: const TextStyle(color: AppRawColors.textSecondaryDark, fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppRawColors.primaryDark, width: 1),
        ),
      ),

      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppRawColors.textPrimaryDark),
        headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppRawColors.textPrimaryDark),
        bodyLarge: TextStyle(fontSize: 16, color: AppRawColors.textPrimaryDark),
        bodyMedium: TextStyle(fontSize: 14, color: AppRawColors.textSecondaryDark),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppRawColors.primaryLight,
      scaffoldBackgroundColor: AppRawColors.backgroundLight,
      fontFamily: 'NeueMontreal',
      colorScheme: const ColorScheme.light(
        primary: AppRawColors.primaryLight,
        secondary: AppRawColors.secondaryLight,
        surface: AppRawColors.surfaceLight,
        error: AppRawColors.errorLight,
        onPrimary: AppRawColors.textPrimaryLight,
        onSecondary: AppRawColors.textSecondaryLight,
      ),

      cardColor: AppRawColors.cardLight,
      iconTheme: const IconThemeData(color: AppRawColors.iconLight),

      appBarTheme: const AppBarTheme(
        backgroundColor: AppRawColors.surfaceLight,
        iconTheme: IconThemeData(color: AppRawColors.iconLight),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppRawColors.primaryLight,
          foregroundColor: AppRawColors.textPrimaryLight,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          elevation: 0,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppRawColors.surfaceVariantLight,
        hintStyle: const TextStyle(color: AppRawColors.textSecondaryLight, fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppRawColors.primaryLight, width: 1),
        ),
      ),

      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppRawColors.textPrimaryLight),
        headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppRawColors.textPrimaryLight),
        bodyLarge: TextStyle(fontSize: 16, color: AppRawColors.textPrimaryLight),
        bodyMedium: TextStyle(fontSize: 14, color: AppRawColors.textSecondaryLight),
      ),
    );
  }
}