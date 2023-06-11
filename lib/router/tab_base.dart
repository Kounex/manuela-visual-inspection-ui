import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manuela_visual_inspection_ui/router/router.dart';
import 'package:manuela_visual_inspection_ui/utils/design_system.dart';
import 'package:manuela_visual_inspection_ui/widgets/base/ui/divider.dart';

class TabBase extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const TabBase({
    super.key,
    required this.navigationShell,
  });

  void _onTap(BuildContext context, int index) {
    if (index != navigationShell.currentIndex) {
      navigationShell.goBranch(index);
    } else {
      if (GoRouter.of(context).canPop()) {
        GoRouter.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final breakpoint = DesignSystem.breakpoint(context: context);

    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (breakpoint > Breakpoint.sm) ...[
            NavigationRail(
              selectedIndex: navigationShell.currentIndex,
              labelType: NavigationRailLabelType.all,
              destinations: TabMeta.values
                  .map(
                    (tab) => NavigationRailDestination(
                      icon: Icon(tab.icon),
                      label: Text(tab.text),
                    ),
                  )
                  .toList(),
              onDestinationSelected: (index) => _onTap(context, index),
            ),
            const VerticalDivider(width: 1.0),
          ],
          Expanded(
            child: navigationShell,
          ),
        ],
      ),
      bottomNavigationBar: breakpoint <= Breakpoint.sm
          ? Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const BaseDivider(),
                NavigationBar(
                  selectedIndex: navigationShell.currentIndex,
                  destinations: TabMeta.values
                      .map(
                        (tab) => NavigationDestination(
                          icon: Icon(tab.icon),
                          label: tab.text,
                        ),
                      )
                      .toList(),
                  onDestinationSelected: (index) => _onTap(context, index),
                ),
              ],
            )
          : const SizedBox(),
    );
  }
}
