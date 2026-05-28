import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../storage/hive_storage.dart';

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  return ThemeModeNotifier();
});

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.system) {
    _loadTheme();
  }

  static const _themeKey = 'theme_mode';

  void _loadTheme() {
    try {
      final settings = HiveStorage.instance.get(HiveStorage.instance.settingsBox, _themeKey);
      if (settings != null && settings['mode'] != null) {
        final modeString = settings['mode'] as String;
        state = ThemeMode.values.firstWhere(
          (e) => e.toString() == modeString,
          orElse: () => ThemeMode.system,
        );
      }
    } catch (_) {
      // Fallback to system theme if Hive call fails or is uninitialized (e.g. in tests)
      state = ThemeMode.system;
    }
  }

  Future<void> toggleTheme(bool isDark) async {
    final newMode = isDark ? ThemeMode.dark : ThemeMode.light;
    state = newMode;
    try {
      await HiveStorage.instance.put(
        HiveStorage.instance.settingsBox,
        _themeKey,
        {'mode': newMode.toString()},
      );
    } catch (_) {}
  }
}
