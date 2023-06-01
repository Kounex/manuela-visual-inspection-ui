import 'package:flutter/material.dart';

sealed class ThemeUtils {
  static ThemeData lightTheme = ThemeData.from(
    colorScheme: const ColorScheme.light(
      primary: Color(0xffee0000),
      secondary: Color(0xffee0000),
      tertiary: Color(0xffee0000),
      background: Color.fromARGB(255, 250, 250, 250),
    ),
  ).copyWith(
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    highlightColor: Colors.transparent,
  );

  static ThemeData darkTheme = ThemeData.from(
    colorScheme: const ColorScheme.dark(
      primary: Color(0xffee0000),
      secondary: Color(0xffee0000),
      tertiary: Color(0xffee0000),
      background: Color(0xff2e2e2e),
    ),
  ).copyWith(
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    highlightColor: Colors.transparent,
  );
}
