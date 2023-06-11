import 'package:flutter/material.dart';
import 'package:manuela_visual_inspection_ui/utils/design_system.dart';
import 'package:manuela_visual_inspection_ui/views/dashboard/widgets/theme_switcher.dart';
import 'package:manuela_visual_inspection_ui/widgets/base/ui/divider.dart';

import '../../widgets/base/ui/title.dart';
import 'widgets/damaged_yolo_images_overview.dart';
import 'widgets/image_show/image_show.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BaseTitle(text: 'MANUela Visual Inspection'),
                Padding(
                  padding: EdgeInsets.only(right: DesignSystem.spacing.x12),
                  child: const ThemeSwitcher(),
                ),
              ],
            ),
            const BaseDivider(),
            const ImageShow(),
            const BaseTitle(text: 'Damaged Parts'),
            const BaseDivider(),
            const DamagedYOLOImagesOverview(),
          ],
        ),
      ),
    );
  }
}
