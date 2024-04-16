import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:manuela_visual_inspection_ui/main.dart';

import '../../utils/design_system.dart';
import '../../widgets/base/ui/card.dart';
import '../../widgets/base/ui/page_title.dart';
import '../../widgets/base/ui/social_block.dart';
import '../../widgets/base/ui/title.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const BasePageTitle(
            title: BaseTitle(text: 'About'),
          ),
          BaseCard(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/logos/flutter.png',
                    height: 48.0,
                  ),
                  SizedBox(height: DesignSystem.spacing.x24),
                  const Text(
                      'This application has been built with Flutter and is open source - as everything should be:'),
                  SocialBlock(
                    socialInfos: [
                      SocialEntry(
                        icon: LineIcons.github,
                        link:
                            'https://github.com/Kounex/manuela-visual-inspection-ui',
                      ),
                    ],
                  ),
                  const Text(
                      'This is part of a bigger project aiming to showcase the end-to-end capabilities of Red Hat OpenShift AI. The project can be found here:'),
                  SocialBlock(
                    socialInfos: [
                      SocialEntry(
                        icon: LineIcons.github,
                        link:
                            'https://github.com/stefan-bergstein/manuela-visual-inspection',
                      ),
                    ],
                  ),
                  SizedBox(height: DesignSystem.spacing.x24),
                  Text(
                    'Version: ${packageInfo.version}+${packageInfo.buildNumber}',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: Theme.of(context).disabledColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
