import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/services/storage_service.dart';
import 'core/theme/app_theme.dart';
import 'router/app_router.dart';
import 'shared/providers/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialise persistent storage before the app starts.
  await StorageService.init();

  runApp(
    // ProviderScope is required at the root for Riverpod to work.
    const ProviderScope(child: PhotoForgeApp()),
  );
}

/// Root application widget.
class PhotoForgeApp extends ConsumerWidget {
  const PhotoForgeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final themeMode = ref.watch(themeProvider);

    return MaterialApp.router(
      title: 'PhotoForge',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}
