import 'package:flutter/material.dart';

/// PhotoForge color palette.
/// Dark professional workspace colors inspired by Lightroom / Snapseed.
class AppColors {
  AppColors._();

  // === Background layers ===
  static const Color background = Color(0xFF0D0D0D);
  static const Color surface = Color(0xFF1A1A1A);
  static const Color surfaceVariant = Color(0xFF242424);
  static const Color surfaceElevated = Color(0xFF2C2C2C);

  // === Borders & dividers ===
  static const Color border = Color(0xFF2E2E2E);
  static const Color divider = Color(0xFF1E1E1E);

  // === Accent (Teal) ===
  static const Color accent = Color(0xFF00BFA5);
  static const Color accentDim = Color(0xFF00897B);
  static const Color accentSurface = Color(0x1F00BFA5);

  // === Text ===
  static const Color textPrimary = Color(0xFFEEEEEE);
  static const Color textSecondary = Color(0xFF9E9E9E);
  static const Color textDisabled = Color(0xFF555555);
  static const Color textOnAccent = Color(0xFF000000);

  // === Status ===
  static const Color error = Color(0xFFCF6679);
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFB300);

  // === Special ===
  static const Color shimmerBase = Color(0xFF1E1E1E);
  static const Color shimmerHighlight = Color(0xFF2A2A2A);
  static const Color overlay = Color(0x80000000);
  static const Color cardShadow = Color(0x40000000);
}
