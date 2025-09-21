import 'package:flutter/material.dart';
import 'package:islam_app/core/AppColors.dart';

class DarkTheme {
  static var darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(primary: AppColors.gold),
    textTheme: TextTheme(
      bodyMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      bodySmall: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: AppColors.gold,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.gold),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.gold,
      unselectedItemColor: AppColors.black,
      selectedItemColor: AppColors.white,
      selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
    ),
    bottomAppBarTheme: BottomAppBarThemeData(color: AppColors.gold),
    scaffoldBackgroundColor: Colors.transparent,
  );
}
