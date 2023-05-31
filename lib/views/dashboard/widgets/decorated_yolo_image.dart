import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:manuela_visual_inspection_ui/utils/design_system.dart';

import '../../../types/classes/yolo_image.dart';

class DecoratedYOLOImage extends StatelessWidget {
  final YOLOImage image;

  final double? height;
  final double? width;

  final double? borderRadius;
  final double? borderWidth;
  final Color? borderColor;

  const DecoratedYOLOImage({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.borderRadius,
    this.borderWidth,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
        border: Border.all(
          color: borderColor ??
              (image.status
                  ? Theme.of(context).colorScheme.errorContainer
                  : Colors.green),
          width: borderWidth ?? DesignSystem.border.width3,
        ),
        borderRadius: BorderRadius.circular(
          borderRadius ?? DesignSystem.border.radius12,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          borderRadius ?? DesignSystem.border.radius12,
        ),
        child: Image.memory(
          base64Decode(
            image.base64.startsWith('data:')
                ? image.base64.split(',').skip(1).join()
                : image.base64,
          ),
          gaplessPlayback: true,
          height: height,
          width: width,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
