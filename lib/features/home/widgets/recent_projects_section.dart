import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../shared/models/project_model.dart';
import '../../../shared/widgets/empty_state_widget.dart';
import '../../../shared/widgets/section_header.dart';
import '../providers/home_provider.dart';

/// Home screen section showing recent editing projects.
class RecentProjectsSection extends ConsumerWidget {
  const RecentProjectsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Recent Projects',
          actionLabel: state.recentProjects.isNotEmpty ? 'See All' : null,
          onAction: state.recentProjects.isNotEmpty
              ? () => context.go(AppConstants.routeProjects)
              : null,
        ),
        const SizedBox(height: 12),
        if (state.isLoading)
          const _LoadingRow()
        else if (state.recentProjects.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingMedium),
            child: EmptyStateWidget(
              icon: Icons.folder_open_outlined,
              headline: 'No projects yet',
              subtext: 'Start editing a photo to create your first project.',
              ctaLabel: 'Start Editing',
              onCta: () => context.go(AppConstants.routeEdit),
            ),
          )
        else
          SizedBox(
            height: 110,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingMedium),
              itemCount: state.recentProjects.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, i) =>
                  _ProjectCard(project: state.recentProjects[i]),
            ),
          ),
      ],
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final ProjectModel project;
  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {}, // Phase 9: open project
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: AppColors.surfaceVariant,
          borderRadius:
              BorderRadius.circular(AppConstants.borderRadiusMedium),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(AppConstants.borderRadiusMedium)),
                child: project.thumbnailPath != null
                    ? Image.asset(project.thumbnailPath!,
                        fit: BoxFit.cover, width: double.infinity)
                    : Container(
                        color: AppColors.surfaceElevated,
                        child: const Icon(Icons.image_outlined,
                            color: AppColors.textDisabled),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(project.name,
                      style: AppTextStyles.labelMedium
                          .copyWith(color: AppColors.textPrimary),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  Text(DateFormatter.relative(project.updatedAt),
                      style: AppTextStyles.labelSmall),
                ],
              ),
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
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingMedium),
        itemCount: 3,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, __) => Container(
          width: 120,
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
