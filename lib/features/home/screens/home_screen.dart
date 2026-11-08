import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/pf_app_bar.dart';
import '../widgets/welcome_banner.dart';
import '../widgets/quick_action_buttons.dart';
import '../widgets/recent_projects_section.dart';
import '../widgets/watermark_presets_section.dart';
import '../providers/home_provider.dart';
import '../../../core/constants/app_constants.dart';

/// Main Home screen — the app entry point after launch.
/// Shows a greeting, quick-action buttons, recent projects, and watermark presets.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const PfAppBar(showLogo: true),
      body: RefreshIndicator(
        onRefresh: () => ref.read(homeProvider.notifier).refresh(),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: const [
            WelcomeBanner(),
            SizedBox(height: AppConstants.paddingSmall),
            QuickActionButtons(),
            SizedBox(height: AppConstants.paddingLarge),
            RecentProjectsSection(),
            SizedBox(height: AppConstants.paddingLarge),
            WatermarkPresetsSection(),
            SizedBox(height: AppConstants.paddingLarge),
          ],
        ),
      ),
    );
  }
}
