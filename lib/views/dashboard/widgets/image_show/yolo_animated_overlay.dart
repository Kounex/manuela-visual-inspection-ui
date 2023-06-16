import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manuela_visual_inspection_ui/types/classes/yolo_image.dart';

import '../../../../services/image_show.dart';
import '../decorated_yolo_image.dart';

class YOLOAnimatedOverlay extends ConsumerWidget {
  final LayerLink link;
  final YOLOImage image;

  final void Function(AnimationController)? onComplete;

  const YOLOAnimatedOverlay({
    super.key,
    required this.link,
    required this.image,
    this.onComplete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// To trigger rebuilds while media query changes
    MediaQuery.of(context);

    final double imageHeight = link.leaderSize!.height * 2 / 3;

    return Positioned(
      height: imageHeight,
      child: CompositedTransformFollower(
        link: link,
        offset: Offset(
          0,
          (link.leaderSize!.height - imageHeight) / 2,
        ),
        child: DecoratedYOLOImage(
          image: image,
          highlight: true,
        )
            .animate(
              onComplete: onComplete,
            )
            .fadeIn(
              duration: const Duration(milliseconds: 1000),
            )
            .moveX(
              duration: Duration(
                milliseconds: ImageShowService.currentAnimationDurationMS(ref),
              ),
              end: link.leaderSize!.width -
                  (image.width != null
                      ? (image.width! * imageHeight / image.height!)
                      : 500),
            )
            .fadeOut(
              delay: Duration(
                milliseconds:
                    ImageShowService.currentAnimationDurationMS(ref) - 1000,
              ),
              duration: const Duration(milliseconds: 1000),
            ),
      ),
    );
  }
}
