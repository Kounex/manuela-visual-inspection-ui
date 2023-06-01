import 'package:flutter/material.dart';

import '../../widgets/base/ui/card.dart';
import '../../widgets/base/ui/page_title.dart';
import '../../widgets/base/ui/title.dart';
import 'widgets/settings_tiles.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          BasePageTitle(
            title: BaseTitle(text: 'Settings'),
          ),
          BaseCard(
            isChildDense: true,
            child: SettingsTiles(),
          ),
        ],
      ),
    );
  }
}
