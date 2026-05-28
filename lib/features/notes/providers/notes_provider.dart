import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/study_note.dart';
import '../data/notes_service.dart';

/// Notes state notifier managing note CRUD and sync lifecycle.
class NotesNotifier extends AsyncNotifier<List<StudyNote>> {
  final NotesService _service = NotesService();

  @override
  Future<List<StudyNote>> build() async {
    return _service.getAllNotes();
  }

  /// Add a new note — saves locally first, then returns.
  Future<void> addNote(StudyNote note) async {
    await _service.saveNote(note);
    state = AsyncValue.data(_service.getAllNotes());
  }

  /// Sync a note: pending → syncing → synced|failed
  Future<void> syncNote(String id) async {
    // Set to syncing
    _updateNoteStatus(id, 'syncing');

    await _service.syncNote(id);
    // Refresh from Hive to get updated status
    state = AsyncValue.data(_service.getAllNotes());
  }

  /// Retry a failed sync.
  Future<void> retrySync(String id) async {
    await syncNote(id);
  }

  /// Delete a note locally.
  Future<void> deleteNote(String id) async {
    await _service.deleteNote(id);
    state = AsyncValue.data(_service.getAllNotes());
  }

  void _updateNoteStatus(String id, String status) {
    state = state.whenData((notes) {
      return notes.map((note) {
        if (note.id == id) {
          return note.copyWith(syncStatus: status);
        }
        return note;
      }).toList();
    });
  }
}

final notesProvider =
    AsyncNotifierProvider<NotesNotifier, List<StudyNote>>(NotesNotifier.new);
