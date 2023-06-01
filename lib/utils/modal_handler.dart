import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manuela_visual_inspection_ui/utils/design_system.dart';

class ModalHandler {
  static Future<T?> showFullscreen<T>({
    required BuildContext context,
    required Widget content,
  }) async =>
      showDialog(
        context: context,
        builder: (context) => Material(
          color: Colors.black,
          child: Stack(
            alignment: Alignment.center,
            children: [
              content,
              Positioned(
                top: 12.0 + MediaQuery.of(context).padding.top,
                right: 12.0 + MediaQuery.of(context).padding.right,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(CupertinoIcons.clear),
                ),
              ),
            ],
          ),
        ),
      );

  static Future<T?> showBaseDialog<T>({
    required BuildContext context,
    required Widget dialogWidget,
    bool barrierDismissible = false,
  }) async =>
      showDialog<T>(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) => dialogWidget,
      );

  static Future<T?> showBaseBottomSheet<T>({
    required BuildContext context,
    required Widget modalWidget,
    bool useRootNavigator = true,
    bool barrierDismissible = false,
    double? maxWidth,
    double additionalBottomViewInsets = 0,
  }) async =>
      showModalBottomSheet(
        context: context,
        useRootNavigator: useRootNavigator,
        isDismissible: false,
        enableDrag: false,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) => _bottomSheetWrapper(
          context: context,
          additionalBottomViewInsets: additionalBottomViewInsets,
          modalWidget: modalWidget,
          maxHeight: MediaQuery.of(context).size.height / 1.5,
          maxWidth: min(MediaQuery.of(context).size.width,
              maxWidth ?? Breakpoint.sm.width),
        ),
      );

  static Widget _bottomSheetWrapper({
    required BuildContext context,
    required Widget modalWidget,
    double maxWidth = double.infinity,
    double maxHeight = double.infinity,
    bool blurryBackground = false,
    double additionalBottomViewInsets = 0,
  }) {
    Widget child = Container(
      decoration: BoxDecoration(
        color: Theme.of(context)
            .cardColor
            .withOpacity(blurryBackground ? DesignSystem.opacityForBlur : 1),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(DesignSystem.border.radius12),
        ),
      ),
      child: modalWidget,
    );

    if (blurryBackground) {
      child = ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: DesignSystem.sigmaBlur,
            sigmaY: DesignSystem.sigmaBlur,
          ),
          child: child,
        ),
      );
    }

    child = Align(
      alignment: Alignment.bottomCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: maxHeight,
          maxWidth: maxWidth,
        ),
        child: child,
      ),
    );

    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom +
                  (MediaQuery.of(context).viewInsets.bottom > 0
                      ? additionalBottomViewInsets
                      : 0)),
          child: child,
        ),
      ),
    );
  }
}
