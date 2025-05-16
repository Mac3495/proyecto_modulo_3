import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proyecto/core/providers/app_providers.dart';
import 'package:proyecto/data/services/ingredient/ingredient_service.dart';
import 'package:proyecto/data/services/ingredient/ingredient_service_imp.dart';
import 'package:proyecto/data/services/login/login_service.dart';
import 'package:proyecto/data/services/login/login_service_imp.dart';
import 'package:proyecto/data/services/user/user_service.dart';
import 'package:proyecto/data/services/user/user_service_imp.dart';

final userServiceProvider = Provider<UserService>(
  (ref) {
    final db = ref.read(appDatabaseProvider).whenOrNull(data: (db) => db);
    if (db == null) throw Exception('Database not found');
    return UserServiceImpl(db);
  },
);

final loginServiceProvider = Provider<LoginService>(
  (ref) {
    final db = ref.watch(appDatabaseProvider).maybeWhen(
          data: (db) => db,
          orElse: () => throw Exception('Database not found'),
        );
    return LoginServiceImpl(db);
  },
);

final ingredientServiceProvider = Provider<IngredientService>((ref) {
  final db = ref.watch(appDatabaseProvider).maybeWhen(
        data: (db) => db,
        orElse: () => throw Exception('Database not available'),
      );
  return IngredientServiceImpl(db);
});
