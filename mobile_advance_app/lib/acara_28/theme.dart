import 'package:flutter/material.dart';
class AppColors {
  static const Color primaryBlue = Color(0xFF3366FF);
  static const Color primaryBlueDark = Color(0xFF2952CC);
  static const Color lightBlue = Color(0xFFB9C9FF);
  static const Color background = Color(0xFFF5F6FA);
  static const Color inputFill = Color(0xFFF0F2F8);
  static const Color textDark = Color(0xFF1B1B1F);
  static const Color textGrey = Color(0xFF8B8D97);
  static const Color divider = Color(0xFFE3E5EC);}
final ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primaryBlue,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Roboto',
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryBlue),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.inputFill,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,),
    hintStyle: const TextStyle(color: AppColors.textGrey, fontSize: 14),),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryBlue,
      foregroundColor: Colors.white,
      minimumSize: const Size.fromHeight(50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),),
      elevation: 0,
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),),);