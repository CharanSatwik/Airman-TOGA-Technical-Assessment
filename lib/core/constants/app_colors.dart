import 'package:flutter/material.dart';

/// App color palette for light and dark modes.
/// All UI should reference these — never hardcode hex values in widgets.
class AppColors {
  AppColors._();

  // ─── Light Mode ───────────────────────────────────────────
  static const Color lightBackground = Color(0xFFF4F7FB);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightBorder = Color(0xFFDDE3ED);
  static const Color lightTextPrimary = Color(0xFF1C2333);
  static const Color lightTextMuted = Color(0xFF505C73);

  // ─── Dark Mode ────────────────────────────────────────────
  static const Color darkBackground = Color(0xFF141820);
  static const Color darkSurface = Color(0xFF1E2433);
  static const Color darkBorder = Color(0xFF2C3347);
  static const Color darkTextPrimary = Color(0xFFCDD5E0);
  static const Color darkTextMuted = Color(0xFF8E9CAE);

  // ─── Shared Accent Colors (same in both modes) ───────────
  static const Color primary = Color(0xFF2F7FD4);
  static const Color secondary = Color(0xFF4BBFB0);
  static const Color accentWarm = Color(0xFFE8944A);
  static const Color success = Color(0xFF3A9E6F);
  static const Color danger = Color(0xFFD94F45);

  // ─── Helpers ──────────────────────────────────────────────

  static Color background(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? darkBackground
      : lightBackground;

  static Color surface(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? darkSurface
      : lightSurface;

  static Color border(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? darkBorder
      : lightBorder;

  static Color textPrimary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? darkTextPrimary
      : lightTextPrimary;

  static Color textMuted(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? darkTextMuted
      : lightTextMuted;
}
