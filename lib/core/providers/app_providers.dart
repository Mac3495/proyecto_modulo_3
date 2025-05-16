import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proyecto/core/config/app_database.dart';
import 'package:proyecto/core/preferences/app_preferences.dart';
import 'package:proyecto/core/providers/app_router_provider.dart';
import 'package:proyecto/core/router/navigation/app_navigator.dart';
import 'package:proyecto/core/router/navigation/app_navigator_imp.dart';
import 'package:sqflite/sqflite.dart';

final appNavigatorProvider = Provider.autoDispose<AppNavigator>(
  (ref) => AppNavigatorImp(router: ref.read(appRouterProvider)),
);

final appPreferencesProvider = Provider<AppPreferences>(
  (ref) => throw UnimplementedError(),
);

final appDatabaseProvider = FutureProvider<Database>((ref) async {
  return await AppDatabase.database;
});