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

  final bool highlight;

  final bool topLeftBorderRadius;
  final bool topRightBorderRadius;
  final bool bottomLeftBorderRadius;
  final bool bottomRightBorderRadius;

  const DecoratedYOLOImage({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.borderRadius,
    this.borderWidth,
    this.borderColor,
    this.highlight = false,
    this.topLeftBorderRadius = true,
    this.topRightBorderRadius = true,
    this.bottomLeftBorderRadius = true,
    this.bottomRightBorderRadius = true,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.only(
      topLeft: topLeftBorderRadius
          ? Radius.circular(borderRadius ?? DesignSystem.border.radius12)
          : Radius.zero,
      topRight: topRightBorderRadius
          ? Radius.circular(borderRadius ?? DesignSystem.border.radius12)
          : Radius.zero,
      bottomLeft: bottomLeftBorderRadius
          ? Radius.circular(borderRadius ?? DesignSystem.border.radius12)
          : Radius.zero,
      bottomRight: bottomRightBorderRadius
          ? Radius.circular(borderRadius ?? DesignSystem.border.radius12)
          : Radius.zero,
    );

    final side = BorderSide(
      color: borderColor ??
          (image.status
              ? Theme.of(context).colorScheme.errorContainer
              : Colors.green[700]!),
      width: borderWidth ?? DesignSystem.border.width05,
    );

    return Container(
      foregroundDecoration: BoxDecoration(
        border: Border(
          right: side.copyWith(
            width: highlight
                ? DesignSystem.border.width8
                : borderWidth ?? DesignSystem.border.width05,
          ),
          top: side,
          left: side,
          bottom: side,
        ),
        borderRadius: radius,
      ),
      child: ClipRRect(
        borderRadius: radius,
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
