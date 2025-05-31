import 'package:proyecto/core/providers/app_providers.dart';
import 'package:proyecto/core/router/routes/routes.dart';
import 'package:proyecto/core/utils/app_constants.dart';
import 'package:proyecto/core/utils/base_module_controller.dart';
import 'package:proyecto/presentation/modules/splash/splash_module_providers.dart';
import 'package:sqflite/sqflite.dart';

class SplashModuleController extends BaseModuleController {
  SplashModuleController(super.ref);

  void checkSession(Database db) {
    final prefs = ref.read(appPreferencesProvider);
    final userId = prefs.getString(key: AppConstants.userId);

    ref
        .read(splashStateNotifierProvider(db).notifier)
        .checkSession(userId: userId.isEmpty ? null : userId);
  }

  void goToLogin() => navigator.pushReplacement(LoginRoutes.login);

  void goToSignup() => navigator.pushReplacement(SignupRoutes.signup, args: AppConstants.adminRol);

  void goToHome(String rol) => navigator.pushReplacement(HomeRoutes.home);

  void goToMaintenance() => navigator.pushReplacement(MaintenanceRoutes.maintenance);
}
