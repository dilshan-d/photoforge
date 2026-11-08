import 'package:flutter_test/flutter_test.dart';
import 'package:photoforge/shared/models/watermark_preset_model.dart';

void main() {
  group('WatermarkPresetModel', () {
    final now = DateTime(2024, 6, 1);

    final preset = WatermarkPresetModel(
      id: 'preset-1',
      name: 'My Brand',
      type: WatermarkType.text,
      text: '© MyBrand',
      opacity: 0.8,
      position: WatermarkPosition.bottomRight,
      createdAt: now,
    );

    test('toMap round-trips correctly', () {
      final map = preset.toMap();
      final restored = WatermarkPresetModel.fromMap(map);

      expect(restored.id, preset.id);
      expect(restored.name, preset.name);
      expect(restored.type, WatermarkType.text);
      expect(restored.text, '© MyBrand');
      expect(restored.opacity, 0.8);
      expect(restored.position, WatermarkPosition.bottomRight);
    });

    test('copyWith overrides opacity', () {
      final updated = preset.copyWith(opacity: 0.5);
      expect(updated.opacity, 0.5);
      expect(updated.name, preset.name);
    });

    test('logo type enum serialises correctly', () {
      final logo = WatermarkPresetModel(
        id: 'logo-1',
        name: 'Logo preset',
        type: WatermarkType.logo,
        logoPath: '/path/to/logo.png',
        createdAt: now,
      );
      final map = logo.toMap();
      final restored = WatermarkPresetModel.fromMap(map);
      expect(restored.type, WatermarkType.logo);
      expect(restored.logoPath, '/path/to/logo.png');
    });
  });
}
