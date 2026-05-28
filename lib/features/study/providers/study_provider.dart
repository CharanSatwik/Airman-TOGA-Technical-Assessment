import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/study_subject.dart';
import '../data/models/chapter.dart';
import '../data/study_service.dart';
import '../../../core/storage/hive_storage.dart';

// ─── Filter & Search State ──────────────────────────────────

/// Current filter: "all" | "in_progress" | "completed" | "not_started"
final studyFilterProvider = StateProvider<String>((ref) => 'all');

/// Current search query.
final searchQueryProvider = StateProvider<String>((ref) => '');

// ─── Study Subjects ─────────────────────────────────────────

/// Main study subjects provider with filtering and search.
class StudyNotifier extends AsyncNotifier<List<StudySubject>> {
  final StudyService _service = StudyService();
  List<StudySubject> _allSubjects = [];

  @override
  Future<List<StudySubject>> build() async {
    final toggleState = ref.watch(chapterToggleProvider);
    final result = await _service.getSubjects();
    if (result.success && result.data != null) {
      final rawSubjects = result.data!;
      _allSubjects = rawSubjects.map((subject) {
        final chapters = StudyService.getChaptersSync(subject.id);
        if (chapters.isEmpty) return subject;

        int completedCount = 0;
        for (final chapter in chapters) {
          final isCompleted = toggleState[chapter.id] ?? chapter.completed;
          if (isCompleted) {
            completedCount++;
          }
        }

        final progress = ((completedCount / chapters.length) * 100).round();
        return subject.copyWith(
          progress: progress,
          lessonsCompleted: completedCount,
          totalLessons: chapters.length,
        );
      }).toList();
      return _allSubjects;
    }
    throw Exception(result.error ?? 'Failed to load subjects');
  }

  List<StudySubject> filterByStatus(String status) {
    if (status == 'all') return _allSubjects;
    return _allSubjects.where((s) => s.status == status).toList();
  }

  List<StudySubject> searchSubjects(String query) {
    if (query.isEmpty) return _allSubjects;
    return _allSubjects
        .where((s) => s.subject.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  /// Get filtered + searched subjects.
  List<StudySubject> getFiltered(String filter, String query) {
    var filtered = _allSubjects;

    // Apply status filter
    if (filter != 'all') {
      final statusMap = {
        'in_progress': 'In Progress',
        'completed': 'Completed',
        'not_started': 'Not Started',
      };
      final statusLabel = statusMap[filter] ?? filter;
      filtered = filtered.where((s) => s.status == statusLabel).toList();
    }

    // Apply search
    if (query.isNotEmpty) {
      filtered = filtered
          .where((s) => s.subject.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    return filtered;
  }
}

final studySubjectsProvider =
    AsyncNotifierProvider<StudyNotifier, List<StudySubject>>(StudyNotifier.new);

// ─── Subject Detail (chapters) ──────────────────────────────

/// Fetches chapters for a specific subject.
final subjectDetailProvider = FutureProvider.autoDispose
    .family<List<Chapter>, String>((ref, subjectId) async {
      final service = StudyService();
      final result = await service.getChapters(subjectId);
      if (result.success && result.data != null) {
        // Merge with local Hive state
        final storage = HiveStorage.instance;
        return result.data!.map((chapter) {
          final stored = storage.get(storage.chaptersBox, chapter.id);
          if (stored != null) {
            return chapter.copyWith(
              completed: stored['completed'] as bool? ?? chapter.completed,
            );
          }
          return chapter;
        }).toList();
      }
      throw Exception(result.error ?? 'Failed to load chapters');
    });

// ─── Chapter Toggle ─────────────────────────────────────────

class ChapterToggleNotifier extends StateNotifier<Map<String, bool>> {
  ChapterToggleNotifier() : super({}) {
    _loadFromHive();
  }

  void _loadFromHive() {
    final storage = HiveStorage.instance;
    final allChapters = storage.getAll(storage.chaptersBox);
    final map = <String, bool>{};
    for (final json in allChapters) {
      map[json['id'] as String] = json['completed'] as bool? ?? false;
    }
    state = map;
  }

  Future<void> toggle(String chapterId, bool currentValue) async {
    final newValue = !currentValue;
    state = {...state, chapterId: newValue};

    // Persist to Hive
    final storage = HiveStorage.instance;
    await storage.put(storage.chaptersBox, chapterId, {
      'id': chapterId,
      'completed': newValue,
    });
  }
}

final chapterToggleProvider =
    StateNotifierProvider<ChapterToggleNotifier, Map<String, bool>>(
      (ref) => ChapterToggleNotifier(),
    );
