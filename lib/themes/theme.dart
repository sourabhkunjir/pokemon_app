import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme ? Colors.grey[900] : Colors.white,
      secondaryHeaderColor: isDarkTheme ? Colors.black : Colors.white,
      dividerColor: isDarkTheme ? Colors.white : Colors.black,
      colorScheme: isDarkTheme
          ? const ColorScheme.dark(
              primary: Colors.white,
              secondary: Colors.black,
            )
          : const ColorScheme.light(
              primary: Colors.black,
              secondary: Colors.white,
            ),
      highlightColor: isDarkTheme ? Colors.grey[700] : Colors.grey[300],
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkTheme ? Colors.black : Colors.white,
        iconTheme: IconThemeData(
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
