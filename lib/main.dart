import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proyecto/core/config/app_database.dart';
import 'package:proyecto/core/preferences/app_preferences.dart';
import 'package:proyecto/core/providers/app_providers.dart';
import 'package:proyecto/core/providers/app_router_provider.dart';
import 'package:proyecto/core/utils/app_constants.dart';
import 'package:proyecto/core/utils/app_theme.dart';
import 'package:proyecto/core/config/firebase/firebase.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDatabase.database;
  await initializeFirebaseApp();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [appPreferencesProvider.overrideWith((ref) => AppPreferences(sharedPreferences))],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      routerConfig: appRouter,
      theme: AppTheme.theme,
    );
  }
}
