import 'package:flutter/material.dart';

/// Spacing and radius constants. All spacing in multiples of 8.
class AppSpacing {
  AppSpacing._();

  // ─── Spacing ──────────────────────────────────────────────
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;

  // ─── Border Radius ────────────────────────────────────────
  static const double cardRadius = 14;
  static const double buttonRadius = 10;
  static const double badgeRadius = 20;

  // ─── Convenience BorderRadius objects ─────────────────────
  static final BorderRadius cardBorderRadius =
      BorderRadius.circular(cardRadius);
  static final BorderRadius buttonBorderRadius =
      BorderRadius.circular(buttonRadius);
  static final BorderRadius badgeBorderRadius =
      BorderRadius.circular(badgeRadius);

  // ─── Common EdgeInsets ────────────────────────────────────
  static const EdgeInsets paddingSm = EdgeInsets.all(sm);
  static const EdgeInsets paddingMd = EdgeInsets.all(md);
  static const EdgeInsets paddingLg = EdgeInsets.all(lg);
  static const EdgeInsets paddingXl = EdgeInsets.all(xl);

  static const EdgeInsets horizontalMd =
      EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets horizontalLg =
      EdgeInsets.symmetric(horizontal: lg);
}
