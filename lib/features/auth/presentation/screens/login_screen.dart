import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../providers/auth_provider.dart';
import '../widgets/cadet_profile_card.dart';

/// Login screen with TOGA branding and cadet profile selection.
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    // Navigate on successful login
    ref.listen(authProvider, (prev, next) {
      if (next.hasValue && next.value != null) {
        context.go('/dashboard');
      }
      if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error.toString())),
        );
      }
    });

    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TOGA Wordmark
                Text(
                  'TOGA',
                  style: TextStyle(fontFamily: 'PlusJakartaSans', 
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                    letterSpacing: 4,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'by AIRMAN Aeronautics',
                  style: AppTextStyles.labelMuted(context),
                ),
                const SizedBox(height: 48),

                // Profile card
                const CadetProfileCard(
                  name: 'Arjun Menon',
                  initials: 'AM',
                  courseInfo: 'PPL · Navigation Phase',
                  ftoName: 'AIRMAN Flight Academy',
                  instructorName: 'Capt. R. Sharma',
                  base: 'Chennai',
                ),
                const SizedBox(height: 32),

                // Continue button
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: AppButton(
                    label: 'Continue as Arjun',
                    isLoading: authState.isLoading,
                    isDisabled: authState.isLoading,
                    onPressed: () {
                      ref.read(authProvider.notifier).login();
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // Switch profile button (placeholder)
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Profile switching coming soon'),
                      ),
                    );
                  },
                  child: Text(
                    'Switch profile',
                    style: AppTextStyles.bodySmall(context).copyWith(
                      color: AppColors.textMuted(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
