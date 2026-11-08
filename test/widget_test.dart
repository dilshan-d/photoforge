import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:photoforge/core/theme/app_theme.dart';
import 'package:photoforge/features/home/screens/home_screen.dart';

void main() {
  testWidgets('HomeScreen renders welcome banner and actions', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: AppTheme.darkTheme,
          home: const HomeScreen(),
        ),
      ),
    );

    // Advance virtual time to complete the initial HomeNotifier._load delay
    await tester.pump(const Duration(milliseconds: 350));
    await tester.pumpAndSettle();

    // Verify key titles and buttons on HomeScreen
    expect(find.text('Create something\nbeautiful.'), findsOneWidget);
    expect(find.text('Start Editing'), findsWidgets);
    expect(find.text('Add Watermark'), findsOneWidget);
    expect(find.text('Recent Projects'), findsOneWidget);
    expect(find.text('Watermark Presets'), findsOneWidget);
  });
}
