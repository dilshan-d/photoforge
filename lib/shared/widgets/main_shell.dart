import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/constants/app_constants.dart';

/// The persistent shell wrapping all 5 main navigation tabs.
/// Renders the [NavigationBar] at the bottom and the current tab [child].
class MainShell extends StatelessWidget {
  final Widget child;
  const MainShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: child,
      bottomNavigationBar: const _PfBottomNav(),
    );
  }
}

class _PfBottomNav extends StatelessWidget {
  const _PfBottomNav();

  static const _destinations = [
    _NavDestination(
      route: AppConstants.routeHome,
      icon: Icons.home_outlined,
      selectedIcon: Icons.home_rounded,
      label: 'Home',
    ),
    _NavDestination(
      route: AppConstants.routeEdit,
      icon: Icons.tune_outlined,
      selectedIcon: Icons.tune_rounded,
      label: 'Edit',
    ),
    _NavDestination(
      route: AppConstants.routeWatermark,
      icon: Icons.copyright_outlined,
      selectedIcon: Icons.copyright_rounded,
      label: 'Watermark',
    ),
    _NavDestination(
      route: AppConstants.routeProjects,
      icon: Icons.folder_outlined,
      selectedIcon: Icons.folder_rounded,
      label: 'Projects',
    ),
    _NavDestination(
      route: AppConstants.routeSettings,
      icon: Icons.settings_outlined,
      selectedIcon: Icons.settings_rounded,
      label: 'Settings',
    ),
  ];

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    for (int i = 0; i < _destinations.length; i++) {
      if (location.startsWith(_destinations[i].route)) return i;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _currentIndex(context);

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border, width: 1)),
      ),
      child: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (i) {
          context.go(_destinations[i].route);
        },
        destinations: _destinations
            .asMap()
            .entries
            .map(
              (e) => NavigationDestination(
                icon: Icon(e.value.icon),
                selectedIcon: Icon(e.value.selectedIcon),
                label: e.value.label,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _NavDestination {
  final String route;
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  const _NavDestination({
    required this.route,
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });
}
