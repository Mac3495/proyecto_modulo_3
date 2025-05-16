import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proyecto/data/models/models.dart';
import 'package:proyecto/presentation/modules/home/home_module_controller.dart';

final homeModuleController = Provider.autoDispose<HomeModuleController>(
  (ref) => HomeModuleController(ref),
);

final userProvider = StateProvider<UserModel?>((ref) => null);

final navigationIndexProvider = StateProvider.autoDispose<int>((ref) => 0);