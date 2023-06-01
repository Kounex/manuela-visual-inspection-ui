import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/user_theme.dart';

class DarkModeSwitch extends ConsumerWidget {
  const DarkModeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userTheme = ref.watch(userThemeProvider);

    return SwitchListTile(
      value: userTheme == ThemeMode.dark ||
          (userTheme == ThemeMode.system &&
              Theme.of(context).brightness == Brightness.dark),
      title: const Text('Dark Mode'),
      onChanged: (darkMode) =>
          ref.read(userThemeProvider.notifier).nextThemeMode(
                mode: darkMode ? ThemeMode.dark : ThemeMode.light,
              ),
    );
  }
}
