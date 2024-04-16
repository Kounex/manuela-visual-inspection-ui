import 'package:flutter/material.dart';
import 'package:manuela_visual_inspection_ui/views/settings/widgets/dark_mode_switch.dart';
import 'package:manuela_visual_inspection_ui/views/settings/widgets/image_show_text_field.dart';
import 'package:manuela_visual_inspection_ui/views/settings/widgets/mock_mode_switch.dart';

class SettingsTiles extends StatelessWidget {
  const SettingsTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...ListTile.divideTiles(
          context: context,
          color: Theme.of(context).dividerColor.withOpacity(0.1),
          tiles: [
            const DarkModeSwitch(),
            const MockModeSwitch(),
            const ImageShowTextField(),
          ],
        ),
      ],
    );
  }
}
