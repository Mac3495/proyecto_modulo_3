import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proyecto/presentation/modules/home/profile/profile_module_controller.dart';

final profileModuleController = Provider.autoDispose<ProfileModuleController>(
  (ref) => ProfileModuleController(ref),
);