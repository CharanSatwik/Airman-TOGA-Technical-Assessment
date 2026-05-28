import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:airman_toga/core/router/app_router.dart';
import 'package:airman_toga/core/storage/hive_storage.dart';
import 'package:airman_toga/core/theme/app_theme.dart';
import 'package:airman_toga/core/theme/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize JSON-in-Hive local storage boxes
  await HiveStorage.instance.init();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: 'Airman TOGA',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      routerConfig: router,
      builder: (context, child) {
        final isDark = themeMode == ThemeMode.system
            ? MediaQuery.platformBrightnessOf(context) == Brightness.dark
            : themeMode == ThemeMode.dark;
        return AnimatedTheme(
          data: isDark ? AppTheme.dark : AppTheme.light,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOut,
          child: child!,
        );
      },
    );
  }
}
