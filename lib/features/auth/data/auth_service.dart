import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../core/network/api_response.dart';
import '../../../core/storage/hive_storage.dart';
import 'package:airman_toga/features/auth/data/models/cadet_profile.dart';
import 'package:airman_toga/features/auth/data/models/fto_info.dart';
import 'package:airman_toga/features/auth/data/models/instructor_info.dart';

/// Auth service with mock login/logout.
class AuthService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  /// Mock login: returns a hardcoded Arjun Menon profile after 600ms delay.
  Future<ApiResponse<CadetProfile>> login(String mockCadetId) async {
    await Future.delayed(const Duration(milliseconds: 600));

    final profile = CadetProfile(
      id: 'cadet_001',
      name: 'Arjun Menon',
      role: 'Cadet',
      course: 'PPL',
      trainingStage: 'Navigation Phase',
      ftoInfo: const FTOInfo(
        id: 'fto_001',
        name: 'AIRMAN Flight Academy',
        location: 'Chennai',
        contactEmail: 'info@airmanflight.com',
      ),
      instructorInfo: const InstructorInfo(
        id: 'instr_001',
        name: 'Capt. R. Sharma',
        rank: 'Captain',
        specialization: 'Navigation & VFR',
      ),
      base: 'Chennai',
      token: 'mock_jwt_token_arjun_menon_2026',
    );

    // Store mock JWT
    await _secureStorage.write(key: 'auth_token', value: profile.token);

    return ApiResponse(success: true, data: profile);
  }

  /// Logout: clears secure storage and Hive boxes.
  Future<void> logout() async {
    await _secureStorage.deleteAll();
    await HiveStorage.instance.clearAll();
  }

  /// Check if a token exists in secure storage.
  Future<String?> getStoredToken() async {
    return _secureStorage.read(key: 'auth_token');
  }

  /// Get current logged-in cadet profile if token exists.
  Future<CadetProfile?> getCurrentProfile() async {
    final token = await getStoredToken();
    if (token == null) return null;
    return CadetProfile(
      id: 'cadet_001',
      name: 'Arjun Menon',
      role: 'Cadet',
      course: 'PPL',
      trainingStage: 'Navigation Phase',
      ftoInfo: const FTOInfo(
        id: 'fto_001',
        name: 'AIRMAN Flight Academy',
        location: 'Chennai',
        contactEmail: 'info@airmanflight.com',
      ),
      instructorInfo: const InstructorInfo(
        id: 'instr_001',
        name: 'Capt. R. Sharma',
        rank: 'Captain',
        specialization: 'Navigation & VFR',
      ),
      base: 'Chennai',
      token: token,
    );
  }
}
