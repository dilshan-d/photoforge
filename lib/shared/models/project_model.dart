/// Represents a PhotoForge editing project.
class ProjectModel {
  final String id;
  final String name;
  final String? thumbnailPath;
  final String? sourceImagePath;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? editSettingsJson; // serialised editing state (Phase 9)

  const ProjectModel({
    required this.id,
    required this.name,
    this.thumbnailPath,
    this.sourceImagePath,
    required this.createdAt,
    required this.updatedAt,
    this.editSettingsJson,
  });

  /// Creates a copy with the specified fields overridden.
  ProjectModel copyWith({
    String? id,
    String? name,
    String? thumbnailPath,
    String? sourceImagePath,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? editSettingsJson,
  }) {
    return ProjectModel(
      id: id ?? this.id,
      name: name ?? this.name,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
      sourceImagePath: sourceImagePath ?? this.sourceImagePath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      editSettingsJson: editSettingsJson ?? this.editSettingsJson,
    );
  }

  /// Convert to a map for SQLite storage.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'thumbnailPath': thumbnailPath,
      'sourceImagePath': sourceImagePath,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'editSettingsJson': editSettingsJson,
    };
  }

  /// Create a [ProjectModel] from a SQLite row map.
  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      id: map['id'] as String,
      name: map['name'] as String,
      thumbnailPath: map['thumbnailPath'] as String?,
      sourceImagePath: map['sourceImagePath'] as String?,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
      editSettingsJson: map['editSettingsJson'] as String?,
    );
  }

  @override
  String toString() => 'ProjectModel(id: $id, name: $name)';
}
