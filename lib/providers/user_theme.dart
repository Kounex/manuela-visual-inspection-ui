import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_theme.g.dart';

@Riverpod(keepAlive: true)
class UserTheme extends _$UserTheme {
  @override
  ThemeMode build() => ThemeMode.system;

  void nextThemeMode({ThemeMode? mode}) {
    if (mode != null) {
      state = mode;
    } else {
      if (state.index + 1 > ThemeMode.values.length - 1) {
        state = ThemeMode.values[1];
      } else {
        state = ThemeMode.values[state.index + 1];
      }
    }
  }
}
