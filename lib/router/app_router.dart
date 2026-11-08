import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/app_constants.dart';
import '../features/home/screens/home_screen.dart';
import '../features/photo_editor/screens/editor_screen.dart';
import '../features/watermark/screens/watermark_screen.dart';
import '../features/projects/screens/projects_screen.dart';
import '../features/settings/screens/settings_screen.dart';
import '../shared/widgets/main_shell.dart';

/// Global navigation provider.
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppConstants.routeHome,
    debugLogDiagnostics: false,
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(
            path: AppConstants.routeHome,
            pageBuilder: (context, state) => _fadePage(
              state,
              const HomeScreen(),
            ),
          ),
          GoRoute(
            path: AppConstants.routeEdit,
            pageBuilder: (context, state) => _fadePage(
              state,
              const EditorScreen(),
            ),
          ),
          GoRoute(
            path: AppConstants.routeWatermark,
            pageBuilder: (context, state) => _fadePage(
              state,
              const WatermarkScreen(),
            ),
          ),
          GoRoute(
            path: AppConstants.routeProjects,
            pageBuilder: (context, state) => _fadePage(
              state,
              const ProjectsScreen(),
            ),
          ),
          GoRoute(
            path: AppConstants.routeSettings,
            pageBuilder: (context, state) => _fadePage(
              state,
              const SettingsScreen(),
            ),
          ),
        ],
      ),
    ],
  );
});

/// Build a [CustomTransitionPage] with a fade transition.
CustomTransitionPage<void> _fadePage(GoRouterState state, Widget child) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
