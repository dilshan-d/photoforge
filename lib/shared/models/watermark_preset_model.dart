/// The type of watermark: text or logo image.
enum WatermarkType { text, logo }

/// One of nine predefined positions, plus free (drag-and-drop).
enum WatermarkPosition {
  topLeft,
  topCenter,
  topRight,
  centerLeft,
  center,
  centerRight,
  bottomLeft,
  bottomCenter,
  bottomRight,
  free,
}

/// A saved watermark preset that can be applied to any image.
class WatermarkPresetModel {
  final String id;
  final String name;
  final WatermarkType type;

  // Text watermark fields
  final String? text;
  final double fontSize;
  final int textColorValue; // stored as ARGB int
  final bool isBold;
  final bool isItalic;
  final double textRotation;

  // Logo watermark fields
  final String? logoPath;
  final double logoScale; // 0.0 – 1.0

  // Shared fields
  final double opacity;
  final WatermarkPosition position;
  final double rotation;
  final DateTime createdAt;

  const WatermarkPresetModel({
    required this.id,
    required this.name,
    required this.type,
    this.text,
    this.fontSize = 24.0,
    this.textColorValue = 0xFFFFFFFF,
    this.isBold = false,
    this.isItalic = false,
    this.textRotation = 0.0,
    this.logoPath,
    this.logoScale = 0.3,
    this.opacity = 0.7,
    this.position = WatermarkPosition.bottomRight,
    this.rotation = 0.0,
    required this.createdAt,
  });

  WatermarkPresetModel copyWith({
    String? id,
    String? name,
    WatermarkType? type,
    String? text,
    double? fontSize,
    int? textColorValue,
    bool? isBold,
    bool? isItalic,
    double? textRotation,
    String? logoPath,
    double? logoScale,
    double? opacity,
    WatermarkPosition? position,
    double? rotation,
    DateTime? createdAt,
  }) {
    return WatermarkPresetModel(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      text: text ?? this.text,
      fontSize: fontSize ?? this.fontSize,
      textColorValue: textColorValue ?? this.textColorValue,
      isBold: isBold ?? this.isBold,
      isItalic: isItalic ?? this.isItalic,
      textRotation: textRotation ?? this.textRotation,
      logoPath: logoPath ?? this.logoPath,
      logoScale: logoScale ?? this.logoScale,
      opacity: opacity ?? this.opacity,
      position: position ?? this.position,
      rotation: rotation ?? this.rotation,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type.name,
      'text': text,
      'fontSize': fontSize,
      'textColorValue': textColorValue,
      'isBold': isBold ? 1 : 0,
      'isItalic': isItalic ? 1 : 0,
      'textRotation': textRotation,
      'logoPath': logoPath,
      'logoScale': logoScale,
      'opacity': opacity,
      'position': position.name,
      'rotation': rotation,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory WatermarkPresetModel.fromMap(Map<String, dynamic> map) {
    return WatermarkPresetModel(
      id: map['id'] as String,
      name: map['name'] as String,
      type: WatermarkType.values.firstWhere((e) => e.name == map['type']),
      text: map['text'] as String?,
      fontSize: (map['fontSize'] as num).toDouble(),
      textColorValue: map['textColorValue'] as int,
      isBold: (map['isBold'] as int) == 1,
      isItalic: (map['isItalic'] as int) == 1,
      textRotation: (map['textRotation'] as num).toDouble(),
      logoPath: map['logoPath'] as String?,
      logoScale: (map['logoScale'] as num).toDouble(),
      opacity: (map['opacity'] as num).toDouble(),
      position: WatermarkPosition.values
          .firstWhere((e) => e.name == map['position']),
      rotation: (map['rotation'] as num).toDouble(),
      createdAt:
          DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }
}
