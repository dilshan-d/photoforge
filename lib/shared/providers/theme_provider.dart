import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/services/storage_service.dart';

/// Manages the app-wide [ThemeMode].
class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(_loadSavedMode());

  static ThemeMode _loadSavedMode() {
    final saved = StorageService.getThemeMode();
    switch (saved) {
      case 'light':
        return ThemeMode.light;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.dark;
    }
  }

  /// Toggle between dark and light modes.
  Future<void> toggle() async {
    final next =
        state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    state = next;
    await StorageService.setThemeMode(
        next == ThemeMode.dark ? 'dark' : 'light');
  }

  /// Set an explicit [ThemeMode].
  Future<void> setMode(ThemeMode mode) async {
    state = mode;
    final key = mode == ThemeMode.dark
        ? 'dark'
        : mode == ThemeMode.light
            ? 'light'
            : 'system';
    await StorageService.setThemeMode(key);
  }
}

/// Global provider for [ThemeMode].
final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
  (ref) => ThemeNotifier(),
);
