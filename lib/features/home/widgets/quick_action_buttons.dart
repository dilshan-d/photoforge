import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_text_styles.dart';
import '../../../core/constants/app_constants.dart';

/// Four quick-action cards displayed in a 2×2 grid on the Home screen.
class QuickActionButtons extends StatelessWidget {
  const QuickActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.paddingMedium,
          vertical: AppConstants.paddingSmall),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2.2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _ActionCard(
            icon: Icons.tune_rounded,
            label: 'Start Editing',
            gradient: const LinearGradient(
              colors: [Color(0xFF00BFA5), Color(0xFF00897B)],
            ),
            onTap: () => context.go(AppConstants.routeEdit),
          ),
          _ActionCard(
            icon: Icons.copyright_rounded,
            label: 'Add Watermark',
            gradient: const LinearGradient(
              colors: [Color(0xFF5C6BC0), Color(0xFF3949AB)],
            ),
            onTap: () => context.go(AppConstants.routeWatermark),
          ),
          _ActionCard(
            icon: Icons.burst_mode_rounded,
            label: 'Batch Process',
            gradient: const LinearGradient(
              colors: [Color(0xFFF57C00), Color(0xFFE65100)],
            ),
            onTap: () => context.go(AppConstants.routeWatermark),
          ),
          _ActionCard(
            icon: Icons.bookmark_rounded,
            label: 'My Presets',
            gradient: const LinearGradient(
              colors: [Color(0xFFAD1457), Color(0xFF880E4F)],
            ),
            onTap: () => context.go(AppConstants.routeSettings),
          ),
        ],
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Gradient gradient;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.label,
    required this.gradient,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 22),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                style: AppTextStyles.titleSmall.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
