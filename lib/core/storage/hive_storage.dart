import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';

/// JSON-in-Hive storage wrapper.
/// All boxes store JSON strings to avoid @HiveType / @freezed conflicts.
class HiveStorage {
  HiveStorage._();
  static final HiveStorage _instance = HiveStorage._();
  static HiveStorage get instance => _instance;

  static const String _notesBoxName = 'notes';
  static const String _notificationsBoxName = 'notifications';
  static const String _chaptersBoxName = 'chapters';
  static const String _settingsBoxName = 'settings';

  late Box<String> _notesBox;
  late Box<String> _notificationsBox;
  late Box<String> _chaptersBox;
  late Box<String> _settingsBox;

  Box<String> get notesBox => _notesBox;
  Box<String> get notificationsBox => _notificationsBox;
  Box<String> get chaptersBox => _chaptersBox;
  Box<String> get settingsBox => _settingsBox;

  /// Call once in main.dart before runApp.
  Future<void> init([String? path]) async {
    if (path != null) {
      Hive.init(path);
    } else {
      await Hive.initFlutter();
    }
    _notesBox = await Hive.openBox<String>(_notesBoxName);
    _notificationsBox = await Hive.openBox<String>(_notificationsBoxName);
    _chaptersBox = await Hive.openBox<String>(_chaptersBoxName);
    _settingsBox = await Hive.openBox<String>(_settingsBoxName);
  }

  // ─── Generic CRUD helpers ─────────────────────────────────

  Future<void> put(
    Box<String> box,
    String key,
    Map<String, dynamic> json,
  ) async {
    await box.put(key, jsonEncode(json));
  }

  Map<String, dynamic>? get(Box<String> box, String key) {
    final raw = box.get(key);
    if (raw == null) return null;
    return jsonDecode(raw) as Map<String, dynamic>;
  }

  List<Map<String, dynamic>> getAll(Box<String> box) {
    return box.values
        .map((raw) => jsonDecode(raw) as Map<String, dynamic>)
        .toList();
  }

  Future<void> delete(Box<String> box, String key) async {
    await box.delete(key);
  }

  Future<void> clearBox(Box<String> box) async {
    await box.clear();
  }

  Future<void> clearAll() async {
    await _notesBox.clear();
    await _notificationsBox.clear();
    await _chaptersBox.clear();
    await _settingsBox.clear();
  }
}
