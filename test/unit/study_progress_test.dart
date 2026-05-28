import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:airman_toga/core/storage/hive_storage.dart';
import 'package:airman_toga/features/study/providers/study_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('hive_study_test_dir');
    await HiveStorage.instance.init(tempDir.path);
  });

  tearDown(() async {
    await Hive.close();
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  group('Study dynamic progress calculation tests', () {
    test('should calculate progress dynamically based on completed chapters in Hive', () async {
      final container = ProviderContainer();
      
      // Initially, subjects should load with default chapter progress from study service
      final subjects = await container.read(studySubjectsProvider.future);
      expect(subjects, isNotEmpty);
      
      // Verify Air Law (sub_01) initially has 5 completed of 5 total chapters (100% progress)
      final airLaw = subjects.firstWhere((s) => s.id == 'sub_01');
      expect(airLaw.progress, 100);
      expect(airLaw.lessonsCompleted, 5);
      expect(airLaw.totalLessons, 5);

      // Now toggle standard rules of the air (ch_01_02) to uncompleted (currently true, toggle will set to false)
      await container.read(chapterToggleProvider.notifier).toggle('ch_01_02', true);

      // Re-read subjects progress
      final updatedSubjects = await container.read(studySubjectsProvider.future);
      final updatedAirLaw = updatedSubjects.firstWhere((s) => s.id == 'sub_01');
      
      // 4 out of 5 chapters completed = 80% progress
      expect(updatedAirLaw.lessonsCompleted, 4);
      expect(updatedAirLaw.progress, 80);
      
      container.dispose();
    });

    test('should maintain individuality and isolation between subjects when updating generic chapters', () async {
      final container = ProviderContainer();

      // Load initial subjects
      final subjects = await container.read(studySubjectsProvider.future);
      
      // Verify Aircraft General Knowledge (sub_04) and Flight Performance & Planning (sub_05) initial states
      // sub_04: 1 of 4 chapters completed by default (25% progress)
      // sub_05: 1 of 4 chapters completed by default (25% progress)
      final sub04 = subjects.firstWhere((s) => s.id == 'sub_04');
      final sub05 = subjects.firstWhere((s) => s.id == 'sub_05');

      expect(sub04.progress, 25);
      expect(sub05.progress, 25);

      // Now toggle core concepts (sub_04_ch_gen_02) on Aircraft General Knowledge (sub_04) to completed
      await container.read(chapterToggleProvider.notifier).toggle('sub_04_ch_gen_02', false);

      // Re-load subjects
      final updatedSubjects = await container.read(studySubjectsProvider.future);
      final updatedSub04 = updatedSubjects.firstWhere((s) => s.id == 'sub_04');
      final updatedSub05 = updatedSubjects.firstWhere((s) => s.id == 'sub_05');

      // sub_04 should now have 2 of 4 chapters completed (50% progress)
      expect(updatedSub04.lessonsCompleted, 2);
      expect(updatedSub04.progress, 50);

      // sub_05 should REMAIN at 1 of 4 chapters completed (25% progress)
      expect(updatedSub05.lessonsCompleted, 1);
      expect(updatedSub05.progress, 25);

      container.dispose();
    });
  });
}
