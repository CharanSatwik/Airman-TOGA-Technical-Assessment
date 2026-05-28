import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:airman_toga/core/storage/hive_storage.dart';
import 'package:airman_toga/features/notes/data/models/study_note.dart';
import 'package:airman_toga/features/notes/data/notes_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Directory tempDir;
  late NotesService notesService;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('hive_sync_test_dir');
    await HiveStorage.instance.init(tempDir.path);
    notesService = NotesService();
  });

  tearDown(() async {
    // Crucial: close Hive to release file locks on notes.lock, etc.
    await Hive.close();
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  group('NotesService local-first synchronization lifecycle', () {
    test('should save note locally with "pending" syncStatus', () async {
      final newNote = StudyNote(
        id: 'test_note_1',
        subjectId: 'sub_meteorology',
        subjectName: 'Meteorology',
        content: 'Test content for cloud formations.',
        createdAt: DateTime.now(),
        syncStatus: 'synced', // Set to synced initially to verify override
      );

      final response = await notesService.saveNote(newNote);
      expect(response.success, isTrue);
      expect(response.data?.syncStatus, 'pending');

      // Verify it's actually saved in Hive with 'pending'
      final allNotes = notesService.getAllNotes();
      expect(allNotes.length, 1);
      expect(allNotes.first.id, 'test_note_1');
      expect(allNotes.first.syncStatus, 'pending');
    });

    test('should order notes in descending order of createdAt', () async {
      final note1 = StudyNote(
        id: 'note_1',
        subjectId: 'sub_1',
        subjectName: 'Sub 1',
        content: 'Content 1',
        createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
      );
      final note2 = StudyNote(
        id: 'note_2',
        subjectId: 'sub_2',
        subjectName: 'Sub 2',
        content: 'Content 2',
        createdAt: DateTime.now(),
      );

      await notesService.saveNote(note1);
      await notesService.saveNote(note2);

      final allNotes = notesService.getAllNotes();
      expect(allNotes.length, 2);
      expect(allNotes[0].id, 'note_2'); // More recent note first
      expect(allNotes[1].id, 'note_1');
    });

    test('should update syncStatus to synced or failed upon remote sync simulation', () async {
      final newNote = StudyNote(
        id: 'test_sync_lifecycle',
        subjectId: 'sub_general',
        subjectName: 'General Knowledge',
        content: 'Aviation physics fundamentals.',
        createdAt: DateTime.now(),
      );

      await notesService.saveNote(newNote);
      
      // Perform simulated sync
      final syncResponse = await notesService.syncNote('test_sync_lifecycle');
      final updatedNote = syncResponse.data;
      
      expect(updatedNote, isNotNull);
      expect(
        updatedNote!.syncStatus,
        anyOf('synced', 'failed'),
      );

      // Verify local database is updated matching the returned state
      final savedNote = notesService.getAllNotes().first;
      expect(savedNote.syncStatus, updatedNote.syncStatus);
    });

    test('should delete note locally from Hive', () async {
      final newNote = StudyNote(
        id: 'test_delete',
        subjectId: 'sub_general',
        subjectName: 'General Knowledge',
        content: 'To be deleted.',
        createdAt: DateTime.now(),
      );

      await notesService.saveNote(newNote);
      expect(notesService.getAllNotes().length, 1);

      final deleteResponse = await notesService.deleteNote('test_delete');
      expect(deleteResponse.success, isTrue);
      expect(notesService.getAllNotes().isEmpty, isTrue);
    });
  });
}
