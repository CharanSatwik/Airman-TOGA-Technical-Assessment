import 'package:flutter/material.dart';


/// App typography using Plus Jakarta Sans (UI) and IBM Plex Mono (numbers).
class AppTextStyles {
  AppTextStyles._();

  // ─── Plus Jakarta Sans (UI text) ──────────────────────────

  static TextStyle headingLarge(BuildContext context) =>
      TextStyle(fontFamily: 'PlusJakartaSans', 
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle headingMedium(BuildContext context) =>
      TextStyle(fontFamily: 'PlusJakartaSans', 
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle bodyRegular(BuildContext context) =>
      TextStyle(fontFamily: 'PlusJakartaSans', 
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle bodySmall(BuildContext context) =>
      TextStyle(fontFamily: 'PlusJakartaSans', 
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle labelMuted(BuildContext context) =>
      TextStyle(fontFamily: 'PlusJakartaSans', 
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.6,
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
      );

  // ─── IBM Plex Mono (numeric values) ──────────────────────

  static TextStyle monoLarge(BuildContext context) =>
      TextStyle(fontFamily: 'IBMPlexMono', 
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle monoSmall(BuildContext context) =>
      TextStyle(fontFamily: 'IBMPlexMono', 
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onSurface,
      );
}
