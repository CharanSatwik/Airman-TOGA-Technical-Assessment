import 'package:flutter_test/flutter_test.dart';
import 'package:airman_toga/features/study/data/models/study_subject.dart';
import 'package:airman_toga/features/notes/data/models/study_note.dart';

void main() {
  group('StudySubject Serialization', () {
    const rawJson = {
      'id': 'sub_001',
      'subject': 'Aviation Meteorology',
      'progress': 75,
      'lessonsCompleted': 15,
      'totalLessons': 20,
      'quizScore': 88,
    };

    test('should correctly deserialize from JSON', () {
      final subject = StudySubject.fromJson(rawJson);
      expect(subject.id, 'sub_001');
      expect(subject.subject, 'Aviation Meteorology');
      expect(subject.progress, 75);
      expect(subject.lessonsCompleted, 15);
      expect(subject.totalLessons, 20);
      expect(subject.quizScore, 88);
      expect(subject.status, 'In Progress');
    });

    test('should correctly serialize to JSON', () {
      final subject = StudySubject.fromJson(rawJson);
      final json = subject.toJson();
      expect(json, rawJson);
    });
  });

  group('StudyNote Serialization', () {
    final now = DateTime.parse('2026-05-28T04:00:00.000Z');
    final rawJson = {
      'id': 'note_001',
      'subjectId': 'sub_001',
      'subjectName': 'Aviation Meteorology',
      'content': 'High pressure systems rotate clockwise in the Northern Hemisphere.',
      'createdAt': now.toIso8601String(),
      'syncStatus': 'synced',
    };

    test('should correctly deserialize from JSON', () {
      final note = StudyNote.fromJson(rawJson);
      expect(note.id, 'note_001');
      expect(note.subjectId, 'sub_001');
      expect(note.subjectName, 'Aviation Meteorology');
      expect(note.content, 'High pressure systems rotate clockwise in the Northern Hemisphere.');
      expect(note.createdAt, now);
      expect(note.syncStatus, 'synced');
    });

    test('should correctly serialize to JSON', () {
      final note = StudyNote.fromJson(rawJson);
      final json = note.toJson();
      expect(json, rawJson);
    });

    test('should default syncStatus to "pending" when missing from JSON', () {
      final jsonMissingSync = Map<String, dynamic>.from(rawJson)..remove('syncStatus');
      final note = StudyNote.fromJson(jsonMissingSync);
      expect(note.syncStatus, 'pending');
    });
  });
}
