import 'package:flutter/material.dart';
import 'package:manuela_visual_inspection_ui/views/settings/widgets/dark_mode.dart';
import 'package:manuela_visual_inspection_ui/views/settings/widgets/image_show_text_field.dart';

class SettingsTiles extends StatelessWidget {
  const SettingsTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...ListTile.divideTiles(
          context: context,
          tiles: [
            const DarkModeSwitch(),
            const ImageShowTextField(),
          ],
        ),
      ],
    );
  }
}
