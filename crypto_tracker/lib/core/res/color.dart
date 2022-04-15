import 'package:flutter/material.dart';

class AppColors {
  static bool isDarkMode = true;

  static Color get primaryColor => Colors.blue[200]!;
  static MaterialColor get primarySwatch => Colors.blue;
  static Color get accentColor => isDarkMode ? primaryColor : Colors.blue[600]!;
  static Color get bgColor =>
      isDarkMode ? const Color(0xFF090D20) : Colors.grey[50]!;
  static Color get cardColor => const Color(0xFF3A498B);
  // Color(0xFF3AF98B)
  //   const Color(0xFF3A498B)
  //const Color(0xFF090D20)

  static ThemeData get getTheme => ThemeData(
        primaryColor: primaryColor,
        primarySwatch: primarySwatch,
        appBarTheme: AppBarTheme(
          backgroundColor: bgColor,
          iconTheme: IconThemeData(
            color: isDarkMode ? Colors.white : Colors.grey[500],
          ),
          elevation: 0,
          foregroundColor: Colors.grey[600],
        ),
        brightness: Brightness.dark,
        backgroundColor: bgColor,
        textTheme: TextTheme(
          displayMedium: TextStyle(
            color: Colors.blueGrey[800],
            fontWeight: FontWeight.w800,
            fontSize: 28,
          ),
          displaySmall: TextStyle(
            color: Colors.blueGrey[800],
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
          labelMedium: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.w600,
          ),
        ),
        scaffoldBackgroundColor: bgColor,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
        ),
      );

  static LinearGradient getGraphLinearGradient(MaterialColor color) {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        color[500]!.withOpacity(0.6),
        color[400]!.withOpacity(0.5),
        color[300]!.withOpacity(0.4),
        AppColors.bgColor.withOpacity(0.3),
      ],
      stops: const [0.4, 0.7, 0.8, 1],
    );
  }

  static LinearGradient getLinearGradient(MaterialColor color) {
    return LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [
        color[300]!,
        color[200]!,
        color[100]!,
      ],
      stops: const [
        0.4,
        0.7,
        0.9,
      ],
    );
  }

  static LinearGradient getDarkLinearGradient(MaterialColor color) {
    return LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        color[600]!.withOpacity(0.7),
        color[500]!.withOpacity(0.7),
        color[400]!.withOpacity(0.7),
      ],
      stops: const [
        0.2,
        0.5,
        1,
      ],
    );
  }
}
