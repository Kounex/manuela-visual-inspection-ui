import 'package:flutter/material.dart';

sealed class ThemeUtils {
  static ThemeData lightTheme = ThemeData.from(
    colorScheme: const ColorScheme.light(
      primary: Color(0xffee0000),
      secondary: Color(0xffee0000),
      tertiary: Color(0xffee0000),
      background: Color(0xffefefef),
    ),
  ).copyWith(
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    highlightColor: Colors.transparent,
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.hovered) &&
            states.contains(MaterialState.selected)) {
          return Colors.white;
        }
        return null;
      }),
    ),
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
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.hovered) &&
            states.contains(MaterialState.selected)) {
          return Colors.black;
        }
        return null;
      }),
    ),
  );
}
