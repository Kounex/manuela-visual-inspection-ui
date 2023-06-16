import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manuela_visual_inspection_ui/utils/design_system.dart';

import '../../../types/classes/yolo_image.dart';
import '../providers/yolo_images.dart';
import 'decorated_yolo_image.dart';

class DamagedYOLOImagesOverview extends ConsumerWidget {
  const DamagedYOLOImagesOverview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<YOLOImage> damagedImages = ref.watch(damagedYOLOImagesProvider);

    return Padding(
      padding: EdgeInsets.all(DesignSystem.spacing.x24),
      child: Wrap(
        spacing: DesignSystem.spacing.x24,
        runSpacing: DesignSystem.spacing.x24,
        children: damagedImages
            .map(
              (damagedImage) => Card(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(DesignSystem.border.radius12),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.errorContainer,
                    width: DesignSystem.border.width05,
                  ),
                ),
                child: SizedBox(
                  height: 128.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DecoratedYOLOImage(
                        image: damagedImage,
                        height: 128.0,
                        topRightBorderRadius: false,
                        bottomRightBorderRadius: false,
                      ),
                      Container(
                        width: 192.0,
                        padding: EdgeInsets.all(DesignSystem.spacing.x24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(damagedImage.timestamp.toUtc().toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList()
            .animate()
            .fade(
              duration: const Duration(milliseconds: 500),
            ),
      ),
    );
  }
}
