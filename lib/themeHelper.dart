import 'package:flutter/material.dart';

class ThemeHelper{


  ThemeData get lightTheme=> ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2DBB55),
      ),

    ),


  );
}