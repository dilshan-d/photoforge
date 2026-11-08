import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

/// Reusable PhotoForge app bar.
/// Renders the app title/logo on the left and optional action widgets on the right.
class PfAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Whether to show "PhotoForge" text logo.
  final bool showLogo;

  /// Custom title widget — takes priority over [showLogo].
  final Widget? title;

  /// Action buttons shown on the trailing side.
  final List<Widget>? actions;

  /// Whether to show a bottom border line.
  final bool showBorder;

  const PfAppBar({
    super.key,
    this.showLogo = true,
    this.title,
    this.actions,
    this.showBorder = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: null,
      automaticallyImplyLeading: false,
      title: title ?? (showLogo ? _buildLogo() : null),
      actions: actions,
      bottom: showBorder
          ? PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Container(
                height: 1,
                color: AppColors.border,
              ),
            )
          : null,
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.accent, AppColors.accentDim],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.photo_camera_rounded,
              color: Colors.black, size: 18),
        ),
        const SizedBox(width: 10),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Photo',
                style: AppTextStyles.titleLarge.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: 'Forge',
                style: AppTextStyles.titleLarge.copyWith(
                  color: AppColors.accent,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
