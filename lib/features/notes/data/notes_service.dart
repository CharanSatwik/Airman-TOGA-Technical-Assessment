import 'dart:math';
import '../../../core/network/api_response.dart';
import '../../../core/storage/hive_storage.dart';
import 'package:airman_toga/features/notes/data/models/study_note.dart';

/// Notes service: local-first save with simulated remote sync.
class NotesService {
  final HiveStorage _storage = HiveStorage.instance;

  /// Saves note locally to Hive with syncStatus "pending".
  Future<ApiResponse<StudyNote>> saveNote(StudyNote note) async {
    final pendingNote = note.copyWith(syncStatus: 'pending');
    await _storage.put(_storage.notesBox, pendingNote.id, pendingNote.toJson());
    return ApiResponse(success: true, data: pendingNote);
  }

  /// Simulates remote sync: 70% success, 30% failure.
  Future<ApiResponse<StudyNote>> syncNote(String noteId) async {
    await Future.delayed(const Duration(milliseconds: 800));

    final noteJson = _storage.get(_storage.notesBox, noteId);
    if (noteJson == null) {
      return const ApiResponse(success: false, error: 'Note not found');
    }

    final note = StudyNote.fromJson(noteJson);
    final random = Random();
    final success = random.nextDouble() < 0.7;

    final updatedNote = note.copyWith(
      syncStatus: success ? 'synced' : 'failed',
    );

    await _storage.put(_storage.notesBox, noteId, updatedNote.toJson());

    if (success) {
      return ApiResponse(success: true, data: updatedNote);
    } else {
      return ApiResponse(
        success: false,
        data: updatedNote,
        error: 'Sync failed. Please try again.',
      );
    }
  }

  /// Loads all notes from Hive.
  List<StudyNote> getAllNotes() {
    return _storage
        .getAll(_storage.notesBox)
        .map((json) => StudyNote.fromJson(json))
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  /// Deletes note locally from Hive.
  Future<ApiResponse<void>> deleteNote(String noteId) async {
    await _storage.delete(_storage.notesBox, noteId);
    return const ApiResponse(success: true);
  }
}
