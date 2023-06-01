import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manuela_visual_inspection_ui/providers/user_theme.dart';
import 'package:manuela_visual_inspection_ui/router/router.dart';
import 'package:manuela_visual_inspection_ui/utils/theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userTheme = ref.watch(userThemeProvider);

    return MaterialApp.router(
      routerConfig: RouterUtils.router,
      debugShowCheckedModeBanner: false,
      themeMode: userTheme,
      theme: ThemeUtils.lightTheme,
      darkTheme: ThemeUtils.darkTheme,
      themeAnimationCurve: Curves.easeInSine,
    );
  }
}
