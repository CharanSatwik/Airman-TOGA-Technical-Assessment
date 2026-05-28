import 'package:flutter/material.dart';

/// Responsive breakpoints and helpers following Material 3 guidelines.
///   compact:  < 600dp  (phones)
///   medium:   600–840dp (small tablets, foldables)
///   expanded: > 840dp  (tablets, desktop)
class ResponsiveUtils {
  ResponsiveUtils._();

  static const double compactBreakpoint = 600;
  static const double expandedBreakpoint = 840;

  static bool isCompact(BuildContext context) =>
      MediaQuery.sizeOf(context).width < compactBreakpoint;

  static bool isMedium(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return w >= compactBreakpoint && w < expandedBreakpoint;
  }

  static bool isExpanded(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= expandedBreakpoint;

  /// Returns [compact], [medium], or [expanded] based on screen width.
  static T responsiveValue<T>(
    BuildContext context, {
    required T compact,
    required T medium,
    required T expanded,
  }) {
    final w = MediaQuery.sizeOf(context).width;
    if (w >= expandedBreakpoint) return expanded;
    if (w >= compactBreakpoint) return medium;
    return compact;
  }

  /// Horizontal content padding that grows with screen size.
  static EdgeInsets responsivePadding(BuildContext context) =>
      EdgeInsets.symmetric(
        horizontal: responsiveValue(
          context,
          compact: 16,
          medium: 24,
          expanded: 32,
        ),
      );

  /// Grid column count for list screens.
  static int responsiveColumns(BuildContext context) =>
      responsiveValue(context, compact: 1, medium: 2, expanded: 3);

  /// Max content width for centered layouts on large screens.
  static double? maxContentWidth(BuildContext context) =>
      isExpanded(context) ? 720 : null;
}
