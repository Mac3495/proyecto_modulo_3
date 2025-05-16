import 'package:proyecto/core/providers/app_providers.dart';
import 'package:proyecto/core/router/routes/routes.dart';
import 'package:proyecto/core/utils/app_constants.dart';
import 'package:proyecto/core/utils/base_module_controller.dart';
import 'package:proyecto/presentation/modules/home/home_module_providers.dart';

class ProfileModuleController extends BaseModuleController {
  ProfileModuleController(super.ref);

  void logout() {
    final prefs = ref.read(appPreferencesProvider);
    prefs.removeValue(AppConstants.userId);
    ref.read(userProvider.notifier).state = null;
    navigator.pushAndRemoveUntil(LoginRoutes.login);
  }
}
