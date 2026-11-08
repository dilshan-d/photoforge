import 'package:flutter_test/flutter_test.dart';
import 'package:photoforge/shared/models/project_model.dart';

void main() {
  group('ProjectModel', () {
    final now = DateTime(2024, 1, 15, 10, 30);

    final model = ProjectModel(
      id: 'test-id-123',
      name: 'My Project',
      createdAt: now,
      updatedAt: now,
    );

    test('toMap produces correct keys', () {
      final map = model.toMap();
      expect(map['id'], 'test-id-123');
      expect(map['name'], 'My Project');
      expect(map['thumbnailPath'], isNull);
      expect(map['createdAt'], now.millisecondsSinceEpoch);
    });

    test('fromMap round-trips correctly', () {
      final map = model.toMap();
      final restored = ProjectModel.fromMap(map);
      expect(restored.id, model.id);
      expect(restored.name, model.name);
      expect(restored.createdAt, model.createdAt);
      expect(restored.updatedAt, model.updatedAt);
    });

    test('copyWith overrides specified fields', () {
      final updated = model.copyWith(name: 'Renamed');
      expect(updated.name, 'Renamed');
      expect(updated.id, model.id);
    });
  });
}
