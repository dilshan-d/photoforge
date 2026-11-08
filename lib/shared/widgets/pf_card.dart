import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_constants.dart';

/// Reusable PhotoForge card widget with optional tap handling.
class PfCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Color? backgroundColor;
  final bool showBorder;

  const PfCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(AppConstants.paddingMedium),
    this.borderRadius = AppConstants.borderRadiusLarge,
    this.backgroundColor,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? AppColors.surface,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        splashColor: AppColors.accent.withValues(alpha: 0.08),
        highlightColor: AppColors.accent.withValues(alpha: 0.04),
        child: Container(
          decoration: showBorder
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(color: AppColors.border, width: 1),
                )
              : null,
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
