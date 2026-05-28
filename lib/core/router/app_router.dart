import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:airman_toga/features/auth/presentation/screens/login_screen.dart';
import 'package:airman_toga/features/auth/providers/auth_provider.dart';
import 'package:airman_toga/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:airman_toga/features/study/presentation/screens/study_subjects_screen.dart';
import 'package:airman_toga/features/study/presentation/screens/subject_detail_screen.dart';
import 'package:airman_toga/features/notes/presentation/screens/notes_screen.dart';
import 'package:airman_toga/features/logbook/presentation/screens/logbook_screen.dart';
import 'package:airman_toga/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:airman_toga/features/profile/presentation/screens/profile_screen.dart';
import 'package:airman_toga/shared/widgets/app_shell.dart';
import 'package:airman_toga/shared/widgets/sliding_branch_container.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/login',
    redirect: (context, state) {
      final isLoggedIn = authState.valueOrNull != null;
      final isLoginRoute = state.matchedLocation == '/login';

      if (!isLoggedIn && !isLoginRoute) return '/login';
      if (isLoggedIn && isLoginRoute) return '/dashboard';
      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
      StatefulShellRoute(
        builder: (_, __, navigationShell) => AppShell(navigationShell: navigationShell),
        navigatorContainerBuilder: (context, navigationShell, children) {
          return SlidingBranchContainer(
            currentIndex: navigationShell.currentIndex,
            children: children,
          );
        },
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(path: '/dashboard', builder: (_, __) => const DashboardScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/study',
              builder: (_, __) => const StudySubjectsScreen(),
              routes: [
                GoRoute(
                  path: ':subjectId',
                  builder: (_, state) => SubjectDetailScreen(
                    subjectId: state.pathParameters['subjectId']!),
                ),
              ],
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/notes', builder: (_, __) => const NotesScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/logbook', builder: (_, __) => const LogbookScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/profile', builder: (_, __) => const ProfileScreen()),
          ]),
        ],
      ),
      GoRoute(path: '/notifications', parentNavigatorKey: _rootNavigatorKey,
        builder: (_, __) => const NotificationsScreen()),
    ],
  );
});
