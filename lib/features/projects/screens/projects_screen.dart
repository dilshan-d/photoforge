import 'package:flutter/material.dart';

import '../../../shared/widgets/pf_app_bar.dart';
import '../../../shared/widgets/empty_state_widget.dart';
import '../../../core/theme/app_colors.dart';

/// Projects screen — placeholder for Phase 9+.
/// Will display all saved editing projects with search and filter support.
class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      appBar: PfAppBar(
        showLogo: false,
        title: Text('Projects'),
      ),
      body: EmptyStateWidget(
        icon: Icons.folder_outlined,
        headline: 'No Projects Yet',
        subtext:
            'Your saved editing projects will appear here. '
            'Start editing a photo to create your first project.',
      ),
    );
  }
}
