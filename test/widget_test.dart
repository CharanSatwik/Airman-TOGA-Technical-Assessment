import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:airman_toga/main.dart';
import 'package:airman_toga/core/storage/hive_storage.dart';
import 'package:airman_toga/features/auth/providers/auth_provider.dart';
import 'package:airman_toga/features/auth/data/models/cadet_profile.dart';

class MockAuthNotifier extends AuthNotifier {
  @override
  Future<CadetProfile?> build() async {
    // Return null immediately in tests to avoid secure storage channel dependencies
    return null;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Directory tempDir;


  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('widget_smoke_test_dir');
    await HiveStorage.instance.init(tempDir.path);
  });

  tearDown(() async {
    await Hive.close();
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  testWidgets('App launch smoke test - displays TOGA logo and profile card', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authProvider.overrideWith(() => MockAuthNotifier()),
        ],
        child: const MyApp(),
      ),
    );
    
    // Pump with a short duration to layout components
    await tester.pump(const Duration(milliseconds: 200));

    // Verify main branding
    expect(find.text('TOGA'), findsOneWidget);
    expect(find.text('by AIRMAN Aeronautics'), findsOneWidget);
    
    // Verify Cadet Profile details are shown
    expect(find.text('Arjun Menon'), findsOneWidget);
    expect(find.text('PPL · Navigation Phase'), findsOneWidget);
    expect(find.text('Continue as Arjun'), findsOneWidget);
  });
}
