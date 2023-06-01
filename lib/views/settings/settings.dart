import 'package:flutter/material.dart';
import 'package:manuela_visual_inspection_ui/utils/design_system.dart';
import 'package:manuela_visual_inspection_ui/views/settings/widgets/settings_tiles.dart';
import 'package:manuela_visual_inspection_ui/widgets/base/ui/card.dart';
import 'package:manuela_visual_inspection_ui/widgets/base/ui/divider.dart';

import '../../widgets/base/ui/title.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: DesignSystem.spacing.x24),
          const BaseTitle(text: 'Settings'),
          SizedBox(height: DesignSystem.spacing.x24),
          const BaseDivider(),
          SizedBox(height: DesignSystem.spacing.x32),
          const BaseCard(
            child: SettingsTiles(),
          ),
        ],
      ),
    );
  }
}
