import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../auth/providers/auth_provider.dart';

import '../../../../core/theme/theme_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final profile = authState.valueOrNull;
    final padding = ResponsiveUtils.responsivePadding(context);

    ref.listen(authProvider, (prev, next) {
      if (next.hasValue && next.value == null) context.go('/login');
    });

    return Scaffold(
      backgroundColor: AppColors.background(context),
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        padding: padding,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              children: [
                const SizedBox(height: 32),
                CircleAvatar(
                  radius: 44,
                  backgroundColor: AppColors.secondary.withValues(alpha: 0.15),
                  child: Text(
                    'AM',
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppColors.secondary,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  profile?.name ?? 'Cadet',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary(context),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${profile?.course ?? ''} · ${profile?.trainingStage ?? ''}',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 14,
                    color: AppColors.textMuted(context),
                  ),
                ),
                const SizedBox(height: 24),

                // Info card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.surface(context),
                    borderRadius: AppSpacing.cardBorderRadius,
                    border: Border.all(color: AppColors.border(context)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _row(context, 'FTO', profile?.ftoInfo.name ?? ''),
                      const SizedBox(height: 12),
                      _row(
                        context,
                        'Instructor',
                        profile?.instructorInfo.name ?? '',
                      ),
                      const SizedBox(height: 12),
                      _row(context, 'Base', profile?.base ?? ''),
                      const SizedBox(height: 12),
                      _row(context, 'Role', profile?.role ?? ''),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Settings card (Theme Toggle)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surface(context),
                    borderRadius: AppSpacing.cardBorderRadius,
                    border: Border.all(color: AppColors.border(context)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Theme.of(context).brightness == Brightness.dark
                                ? Icons.dark_mode_outlined
                                : Icons.light_mode_outlined,
                            color: AppColors.textMuted(context),
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Dark Mode',
                            style: TextStyle(
                              fontFamily: 'PlusJakartaSans',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textPrimary(context),
                            ),
                          ),
                        ],
                      ),
                      Switch(
                        value: Theme.of(context).brightness == Brightness.dark,
                        onChanged: (isDark) {
                          ref
                              .read(themeModeProvider.notifier)
                              .toggleTheme(isDark);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                AppButton(
                  label: 'Logout',
                  backgroundColor: AppColors.danger,
                  onPressed: () => ref.read(authProvider.notifier).logout(),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _row(BuildContext context, String label, String value) {
    return Row(
      children: [
        SizedBox(
          width: 90,
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.textMuted(context),
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary(context),
            ),
          ),
        ),
      ],
    );
  }
}
