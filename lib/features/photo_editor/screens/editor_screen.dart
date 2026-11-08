import 'package:flutter/material.dart';

import '../../../shared/widgets/pf_app_bar.dart';
import '../../../shared/widgets/empty_state_widget.dart';
import '../../../core/theme/app_colors.dart';

/// Photo Editor screen — placeholder for Phase 2+.
/// Will host the full image editing workspace with sliders and filter tools.
class EditorScreen extends StatelessWidget {
  const EditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      appBar: PfAppBar(
        showLogo: false,
        title: Text('Photo Editor'),
      ),
      body: EmptyStateWidget(
        icon: Icons.tune_outlined,
        headline: 'Editor Coming Soon',
        subtext:
            'The full photo editing workspace will be available in Phase 2. '
            'Stay tuned for brightness, contrast, saturation, and filter controls.',
      ),
    );
  }
}
