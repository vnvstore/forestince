// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:nexus_english/l10n/app_localizations.dart';

// Stateful navigation based on:
// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    if (size.width < 450) {
      return ScaffoldWithNavigationBar(
        body: navigationShell,
        currentIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
      );
    } else {
      return ScaffoldWithNavigationRail(
        body: navigationShell,
        currentIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
      );
    }
  }
}

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  final Widget body;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    double size = 18;

    return Scaffold(
      body: body,
      bottomNavigationBar: Theme(
        // Use a local Theme override to disable the NavigationBar indicator
        data: Theme.of(context).copyWith(
          navigationBarTheme: Theme.of(context).navigationBarTheme.copyWith(
                indicatorColor: Colors.transparent,
              ),
        ),
        child: NavigationBar(
          selectedIndex: currentIndex,
          destinations: [
            // Dashboard

            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/images/bottom_nav_dashboard.svg',
                colorFilter: ColorFilter.mode(cs.onSurface, BlendMode.srcIn),
                width: size,
                height: size,
              ),
              selectedIcon: SvgPicture.asset(
                'assets/images/bottom_nav_dashboard.svg',
                colorFilter: ColorFilter.mode(cs.primary, BlendMode.srcIn),
                width: size,
                height: size,
              ),
              label: AppLocalizations.of(context)!.dashboardTitle,
            ),
            //Facility
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/images/bottom_nav_facility.svg',
                colorFilter: ColorFilter.mode(cs.onSurface, BlendMode.srcIn),
                width: size,
                height: size,
              ),
              selectedIcon: SvgPicture.asset(
                'assets/images/bottom_nav_facility.svg',
                colorFilter: ColorFilter.mode(cs.primary, BlendMode.srcIn),
                width: size,
                height: size,
              ),
              label: AppLocalizations.of(context)!.facilityTitle,
            ),
            // Users
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/images/bottom_nav_user.svg',
                colorFilter: ColorFilter.mode(cs.onSurface, BlendMode.srcIn),
                width: size,
                height: size,
              ),
              selectedIcon: SvgPicture.asset(
                'assets/images/bottom_nav_user.svg',
                colorFilter: ColorFilter.mode(cs.primary, BlendMode.srcIn),
                width: size,
                height: size,
              ),
              label: AppLocalizations.of(context)!.userTitle,
            ),
            // Reports
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/images/bottom_nav_report.svg',
                colorFilter: ColorFilter.mode(cs.onSurface, BlendMode.srcIn),
                width: size,
                height: size,
              ),
              selectedIcon: SvgPicture.asset(
                'assets/images/bottom_nav_report.svg',
                colorFilter: ColorFilter.mode(cs.primary, BlendMode.srcIn),
                width: size,
                height: size,
              ),
              label: AppLocalizations.of(context)!.reportTitle,
            ),
          ],
          onDestinationSelected: onDestinationSelected,
        ),
      ),
    );
  }
}

class ScaffoldWithNavigationRail extends StatelessWidget {
  const ScaffoldWithNavigationRail({
    super.key,
    required this.body,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  final Widget body;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    double size = 18;
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            useIndicator: false,
            selectedIndex: currentIndex,
            onDestinationSelected: onDestinationSelected,
            labelType: NavigationRailLabelType.all,
            destinations: <NavigationRailDestination>[
              NavigationRailDestination(
                icon: SvgPicture.asset(
                  'assets/images/bottom_nav_dashboard.svg',
                  colorFilter: ColorFilter.mode(cs.onSurface, BlendMode.srcIn),
                  width: size,
                  height: size,
                ),
                selectedIcon: SvgPicture.asset(
                  'assets/images/bottom_nav_dashboard.svg',
                  colorFilter: ColorFilter.mode(cs.primary, BlendMode.srcIn),
                  width: size,
                  height: size,
                ),
                label: Text(AppLocalizations.of(context)!.dashboardTitle),
              ),
              NavigationRailDestination(
                icon: SvgPicture.asset(
                  'assets/images/bottom_nav_facility.svg',
                  colorFilter: ColorFilter.mode(cs.onSurface, BlendMode.srcIn),
                  width: size,
                  height: size,
                ),
                selectedIcon: SvgPicture.asset(
                  'assets/images/bottom_nav_facility.svg',
                  colorFilter: ColorFilter.mode(cs.primary, BlendMode.srcIn),
                  width: size,
                  height: size,
                ),
                label: Text(AppLocalizations.of(context)!.facilityTitle),
              ),
              NavigationRailDestination(
                icon: SvgPicture.asset(
                  'assets/images/bottom_nav_user.svg',
                  colorFilter: ColorFilter.mode(cs.onSurface, BlendMode.srcIn),
                  width: size,
                  height: size,
                ),
                selectedIcon: SvgPicture.asset(
                  'assets/images/bottom_nav_user.svg',
                  colorFilter: ColorFilter.mode(cs.primary, BlendMode.srcIn),
                  width: size,
                  height: size,
                ),
                label: Text(AppLocalizations.of(context)!.userTitle),
              ),
              NavigationRailDestination(
                icon: SvgPicture.asset(
                  'assets/images/bottom_nav_report.svg',
                  colorFilter: ColorFilter.mode(cs.onSurface, BlendMode.srcIn),
                  width: size,
                  height: size,
                ),
                selectedIcon: SvgPicture.asset(
                  'assets/images/bottom_nav_report.svg',
                  colorFilter: ColorFilter.mode(cs.primary, BlendMode.srcIn),
                  width: size,
                  height: size,
                ),
                label: Text(AppLocalizations.of(context)!.reportTitle),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}
