import 'package:flutter/material.dart';
import 'package:manuela_visual_inspection_ui/widgets/base/ui/title.dart';

import '../../../utils/design_system.dart';
import 'divider.dart';

class BasePageTitle extends StatelessWidget {
  final BaseTitle title;

  final Color? color;

  final double? bottomPadding;

  const BasePageTitle({
    super.key,
    required this.title,
    this.color,
    this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          color ?? Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
      child: Column(
        children: [
          SizedBox(height: DesignSystem.spacing.x24),
          title,
          SizedBox(height: DesignSystem.spacing.x24),
          const BaseDivider(),
        ],
      ),
    );
  }
}
