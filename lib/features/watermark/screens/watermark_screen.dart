import 'package:flutter/material.dart';

import '../../../shared/widgets/pf_app_bar.dart';
import '../../../shared/widgets/empty_state_widget.dart';
import '../../../core/theme/app_colors.dart';

/// Watermark screen — placeholder for Phase 3+.
/// Will allow users to create text/logo watermarks and manage presets.
class WatermarkScreen extends StatelessWidget {
  const WatermarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      appBar: PfAppBar(
        showLogo: false,
        title: Text('Watermark'),
      ),
      body: EmptyStateWidget(
        icon: Icons.copyright_outlined,
        headline: 'Watermark Studio Coming Soon',
        subtext:
            'Text and logo watermark creation, preset management, and batch '
            'watermarking will be available in Phase 3.',
      ),
    );
  }
}
