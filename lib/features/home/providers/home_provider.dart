import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/models/project_model.dart';
import '../../../shared/models/watermark_preset_model.dart';

/// State for the Home screen.
class HomeState {
  final List<ProjectModel> recentProjects;
  final List<WatermarkPresetModel> watermarkPresets;
  final bool isLoading;

  const HomeState({
    this.recentProjects = const [],
    this.watermarkPresets = const [],
    this.isLoading = false,
  });

  HomeState copyWith({
    List<ProjectModel>? recentProjects,
    List<WatermarkPresetModel>? watermarkPresets,
    bool? isLoading,
  }) {
    return HomeState(
      recentProjects: recentProjects ?? this.recentProjects,
      watermarkPresets: watermarkPresets ?? this.watermarkPresets,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

/// Notifier for the Home screen.
/// Fetches recent projects and presets from local storage (stubbed in Phase 1).
class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(const HomeState()) {
    _load();
  }

  Future<void> _load() async {
    state = state.copyWith(isLoading: true);
    // Phase 9 will wire up real DB calls here.
    // For now, we start with empty lists.
    await Future.delayed(const Duration(milliseconds: 300));
    state = state.copyWith(
      recentProjects: [],
      watermarkPresets: [],
      isLoading: false,
    );
  }

  /// Refresh all home screen data.
  Future<void> refresh() => _load();
}

final homeProvider =
    StateNotifierProvider<HomeNotifier, HomeState>((ref) => HomeNotifier());
