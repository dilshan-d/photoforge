import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/pf_app_bar.dart';
import '../../../shared/providers/theme_provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/services/storage_service.dart';

/// Settings screen — app preferences and configuration.
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const PfAppBar(
        showLogo: false,
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          const _SectionLabel(label: 'Appearance'),
          _SettingsTile(
            icon: Icons.dark_mode_outlined,
            title: 'Dark Mode',
            trailing: Switch(
              value: themeMode == ThemeMode.dark,
              activeTrackColor: AppColors.accent,
              onChanged: (_) =>
                  ref.read(themeProvider.notifier).toggle(),
            ),
          ),
          const _Divider(),
          const _SectionLabel(label: 'Export'),
          _SettingsTile(
            icon: Icons.high_quality_outlined,
            title: 'Default Export Quality',
            subtitle: '${StorageService.getDefaultQuality()}%',
            onTap: () {}, // Phase 7: quality picker
          ),
          _SettingsTile(
            icon: Icons.image_outlined,
            title: 'Default Format',
            subtitle: StorageService.getDefaultExportFormat().toUpperCase(),
            onTap: () {}, // Phase 7: format picker
          ),
          const _Divider(),
          const _SectionLabel(label: 'Watermark'),
          _SettingsTile(
            icon: Icons.opacity_outlined,
            title: 'Default Opacity',
            subtitle:
                '${(StorageService.getDefaultOpacity() * 100).toStringAsFixed(0)}%',
            onTap: () {}, // Phase 3: opacity picker
          ),
          const _Divider(),
          const _SectionLabel(label: 'About'),
          const _SettingsTile(
            icon: Icons.info_outline,
            title: AppConstants.appName,
            subtitle: 'Version ${AppConstants.appVersion}',
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppConstants.paddingMedium,
        AppConstants.paddingMedium,
        AppConstants.paddingMedium,
        4,
      ),
      child: Text(
        label.toUpperCase(),
        style: AppTextStyles.labelSmall.copyWith(
          letterSpacing: 1.2,
          color: AppColors.accent,
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColors.surface,
      leading: Icon(icon, color: AppColors.textSecondary, size: 22),
      title: Text(title, style: AppTextStyles.titleSmall),
      subtitle: subtitle != null
          ? Text(subtitle!, style: AppTextStyles.bodySmall)
          : null,
      trailing: trailing ??
          (onTap != null
              ? const Icon(Icons.chevron_right,
                  color: AppColors.textDisabled, size: 20)
              : null),
      onTap: onTap,
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 1, indent: 56, color: AppColors.divider);
  }
}
