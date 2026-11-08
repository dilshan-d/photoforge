import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

/// Generic empty state widget with an icon, headline, subtext, and optional CTA.
class EmptyStateWidget extends StatelessWidget {
  final IconData icon;
  final String headline;
  final String subtext;
  final String? ctaLabel;
  final VoidCallback? onCta;

  const EmptyStateWidget({
    super.key,
    required this.icon,
    required this.headline,
    required this.subtext,
    this.ctaLabel,
    this.onCta,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: const BoxDecoration(
                color: AppColors.surfaceVariant,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 32, color: AppColors.textDisabled),
            ),
            const SizedBox(height: 16),
            Text(
              headline,
              style: AppTextStyles.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              subtext,
              style: AppTextStyles.bodyMedium,
              textAlign: TextAlign.center,
            ),
            if (ctaLabel != null && onCta != null) ...[
              const SizedBox(height: 20),
              FilledButton(
                onPressed: onCta,
                child: Text(ctaLabel!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
