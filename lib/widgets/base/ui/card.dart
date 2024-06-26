import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manuela_visual_inspection_ui/utils/design_system.dart';

import 'divider.dart';

class BaseCard extends StatefulWidget {
  final Widget child;
  final bool centerChild;

  final bool expandable;
  final bool expanded;

  final Widget? above;
  final Widget? below;

  final bool constrained;

  final Color? backgroundColor;
  final bool paintBorder;
  final Color? borderColor;

  final String? title;
  final Widget? titleWidget;

  final Widget? trailingTitleWidget;

  final double? topPadding;
  final double? rightPadding;
  final double? bottomPadding;
  final double? leftPadding;

  final EdgeInsetsGeometry? paddingChild;
  final EdgeInsetsGeometry? titlePadding;

  final bool isChildDense;

  final CrossAxisAlignment titleCrossAlignment;

  final double elevation;

  final double? borderRadius;

  const BaseCard({
    Key? key,
    required this.child,
    this.expandable = false,
    this.expanded = true,
    this.above,
    this.below,
    this.centerChild = true,
    this.constrained = true,
    this.backgroundColor,
    this.paintBorder = false,
    this.borderColor,
    this.title,
    this.titleWidget,
    this.trailingTitleWidget,
    this.paddingChild,
    this.topPadding,
    this.rightPadding,
    this.bottomPadding,
    this.leftPadding,
    this.titlePadding,
    this.isChildDense = false,
    this.titleCrossAlignment = CrossAxisAlignment.center,
    this.elevation = 0.0,
    this.borderRadius,
  }) : super(key: key);

  @override
  State<BaseCard> createState() => _BaseCardState();
}

class _BaseCardState extends State<BaseCard> {
  int _expandedTurn = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if ((widget.expanded && _expandedTurn % 2 != 0) ||
        (!widget.expanded && _expandedTurn % 2 == 0)) {
      setState(() => _expandedTurn++);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget card = Padding(
      padding: EdgeInsets.only(
        top: widget.topPadding ?? DesignSystem.spacing.x24,
        right: widget.rightPadding ?? DesignSystem.spacing.x24,
        bottom: widget.bottomPadding ?? DesignSystem.spacing.x24,
        left: widget.leftPadding ?? DesignSystem.spacing.x24,
      ),
      child: Card(
        clipBehavior: Clip.hardEdge,
        shadowColor: widget.backgroundColor != null &&
                widget.backgroundColor!.value == Colors.transparent.value
            ? Colors.transparent
            : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              widget.borderRadius ?? DesignSystem.border.radius12),
          side: widget.paintBorder
              ? BorderSide(color: widget.borderColor ?? Colors.transparent)
              : BorderSide.none,
        ),
        color: widget.backgroundColor ?? Theme.of(context).cardColor,
        elevation: widget.elevation,
        margin: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: widget.centerChild
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          crossAxisAlignment: widget.centerChild
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            if (widget.titleWidget != null || widget.title != null)
              Padding(
                padding: widget.titlePadding ??
                    EdgeInsets.symmetric(
                      horizontal: DesignSystem.spacing.x24,
                      vertical: DesignSystem.spacing.x12,
                    ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: widget.titleWidget == null
                            ? Text(
                                widget.title!,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              )
                            : widget.titleWidget!),
                    if (widget.expandable || widget.trailingTitleWidget != null)
                      widget.expandable
                          ? AnimatedRotation(
                              duration:
                                  DesignSystem.animation.defaultDurationMS250,
                              turns: _expandedTurn / 2,
                              curve: Curves.easeInCubic,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(32),
                                onTap: () => setState(() => _expandedTurn++),
                                // behavior: HitTestBehavior.opaque,
                                child: const SizedBox(
                                  height: 32.0,
                                  width: 32.0,
                                  child: Icon(
                                    CupertinoIcons.chevron_up,
                                  ),
                                ),
                              ),
                            )
                          : widget.trailingTitleWidget!
                  ],
                ),
              ),
            AnimatedAlign(
              duration: DesignSystem.animation.defaultDurationMS250,
              heightFactor: _expandedTurn % 2 == 0 ? 1.0 : 0.0,
              alignment: const Alignment(0, -1),
              curve: Curves.easeInCubic,
              child: Column(
                children: [
                  if (widget.titleWidget != null || widget.title != null)
                    const BaseDivider(),
                  Padding(
                    padding: widget.paddingChild ??
                        EdgeInsets.all(widget.isChildDense
                            ? DesignSystem.spacing.x12
                            : DesignSystem.spacing.x24),
                    child: widget.child,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    if (!widget.constrained) return card;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: Breakpoint.sm.width),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.above != null) widget.above!,
            card,
            if (widget.below != null) widget.below!,
          ],
        ),
      ),
    );
  }
}
