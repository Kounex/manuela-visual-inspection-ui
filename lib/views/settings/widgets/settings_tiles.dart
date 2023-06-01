import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manuela_visual_inspection_ui/main.dart';
import 'package:manuela_visual_inspection_ui/providers/image_show_animation.dart';
import 'package:manuela_visual_inspection_ui/utils/design_system.dart';

import '../../../providers/user_theme.dart';

class SettingsTiles extends ConsumerStatefulWidget {
  const SettingsTiles({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsTilesState();
}

class _SettingsTilesState extends ConsumerState<SettingsTiles> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(
      text: ref.read(imageShowAnimationProvider)?.toString() ??
          env.imageShowAnimationMS?.toString() ??
          '10000',
    );
  }

  @override
  Widget build(BuildContext context) {
    final userTheme = ref.watch(userThemeProvider);
    final imageShowAnimation = ref.watch(imageShowAnimationProvider);

    return Column(
      children: [
        ...ListTile.divideTiles(
          context: context,
          tiles: [
            SwitchListTile(
              value: userTheme == ThemeMode.dark ||
                  (userTheme == ThemeMode.system &&
                      Theme.of(context).brightness == Brightness.dark),
              title: const Text('Dark Mode'),
              onChanged: (darkMode) =>
                  ref.read(userThemeProvider.notifier).nextThemeMode(
                        mode: darkMode ? ThemeMode.dark : ThemeMode.light,
                      ),
            ),
            ListTile(
              title: const Text('Image Show Animation Duration'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    child: TextField(
                      controller: _controller,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        isDense: true,
                      ),
                      onEditingComplete: () {
                        int? newValue = int.tryParse(_controller.text);
                        if (newValue != null) {
                          ref
                              .read(imageShowAnimationProvider.notifier)
                              .setDurationMS(newValue);
                        } else {
                          _controller.text = ref
                                  .read(imageShowAnimationProvider)
                                  ?.toString() ??
                              env.imageShowAnimationMS?.toString() ??
                              '10000';
                        }
                      },
                    ),
                  ),
                  SizedBox(width: DesignSystem.spacing.x12),
                  const Text('milliseconds'),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
