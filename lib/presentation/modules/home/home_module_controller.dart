import 'package:proyecto/core/utils/base_module_controller.dart';
import 'package:proyecto/presentation/modules/home/home_module_providers.dart';

class HomeModuleController extends BaseModuleController {
  HomeModuleController(super.ref);

  void updateNavigationIndex(int index) => ref.read(navigationIndexProvider.notifier).state = index;
}
