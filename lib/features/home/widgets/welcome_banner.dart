import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/constants/app_constants.dart';

/// Greeting banner at the top of the Home screen.
class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});

  String get _greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning';
    if (hour < 17) return 'Good afternoon';
    return 'Good evening';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppConstants.paddingMedium,
        AppConstants.paddingLarge,
        AppConstants.paddingMedium,
        AppConstants.paddingSmall,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _greeting,
            style: AppTextStyles.bodyMedium,
          ),
          const SizedBox(height: 4),
          Text(
            'Create something\nbeautiful.',
            style: AppTextStyles.displayMedium.copyWith(
              color: AppColors.textPrimary,
              height: 1.15,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Professional photo editing & watermarking studio.',
            style: AppTextStyles.bodyMedium,
          ),
        ],
      ),
    );
  }
}
