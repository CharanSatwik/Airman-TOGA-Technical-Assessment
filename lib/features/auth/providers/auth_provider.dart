import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:airman_toga/features/auth/data/auth_service.dart';
import 'package:airman_toga/features/auth/data/models/cadet_profile.dart';

/// Auth state notifier managing login/logout lifecycle.
class AuthNotifier extends AsyncNotifier<CadetProfile?> {
  final AuthService _authService = AuthService();

  @override
  Future<CadetProfile?> build() async {
    return _authService.getCurrentProfile();
  }

  Future<void> login() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final result = await _authService.login('cadet_001');
      if (result.success && result.data != null) {
        return result.data;
      }
      throw Exception(result.error ?? 'Login failed');
    });
  }

  Future<void> logout() async {
    await _authService.logout();
    state = const AsyncValue.data(null);
  }
}

/// The main auth provider.
final authProvider = AsyncNotifierProvider<AuthNotifier, CadetProfile?>(
  AuthNotifier.new,
);
