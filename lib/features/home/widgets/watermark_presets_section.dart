import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/constants/app_constants.dart';
import '../../../shared/models/watermark_preset_model.dart';
import '../../../shared/widgets/empty_state_widget.dart';
import '../../../shared/widgets/section_header.dart';
import '../providers/home_provider.dart';

/// Home screen section showing saved watermark presets.
class WatermarkPresetsSection extends ConsumerWidget {
  const WatermarkPresetsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Watermark Presets',
          actionLabel: state.watermarkPresets.isNotEmpty ? 'See All' : null,
          onAction: state.watermarkPresets.isNotEmpty
              ? () => context.go(AppConstants.routeWatermark)
              : null,
        ),
        const SizedBox(height: 12),
        if (state.isLoading)
          const _LoadingRow()
        else if (state.watermarkPresets.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingMedium),
            child: EmptyStateWidget(
              icon: Icons.copyright_outlined,
              headline: 'No presets saved',
              subtext: 'Create a watermark preset to apply it quickly later.',
              ctaLabel: 'Create Preset',
              onCta: () => context.go(AppConstants.routeWatermark),
            ),
          )
        else
          SizedBox(
            height: 72,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingMedium),
              itemCount: state.watermarkPresets.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, i) =>
                  _PresetChip(preset: state.watermarkPresets[i]),
            ),
          ),
      ],
    );
  }
}

/// A compact chip-style card representing a single watermark preset.
class _PresetChip extends StatelessWidget {
  final WatermarkPresetModel preset;
  const _PresetChip({required this.preset});

  @override
  Widget build(BuildContext context) {
    final isText = preset.type == WatermarkType.text;

    return GestureDetector(
      onTap: () => context.go(AppConstants.routeWatermark),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: AppColors.accentSurface,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isText ? Icons.text_fields_rounded : Icons.image_rounded,
                color: AppColors.accent,
                size: 18,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  preset.name,
                  style: AppTextStyles.labelLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  isText ? 'Text watermark' : 'Logo watermark',
                  style: AppTextStyles.labelSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LoadingRow extends StatelessWidget {
  const _LoadingRow();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingMedium),
        itemCount: 3,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, __) => Container(
          width: 160,
          decoration: BoxDecoration(
            color: AppColors.shimmerBase,
            borderRadius:
                BorderRadius.circular(AppConstants.borderRadiusMedium),
          ),
        ),
      ),
    );
  }
}
