import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proyecto/data/models/common/service_result_generic_state.dart';
import 'package:proyecto/data/models/models.dart';
import 'package:proyecto/data/services/service_providers.dart';
import 'package:proyecto/presentation/modules/home/ingredient/ingredient_module_controller.dart';
import 'package:proyecto/presentation/modules/home/ingredient/ingredient_module_notifiers.dart';

final ingredientModuleController =
    Provider<IngredientModuleController>((ref) => IngredientModuleController(ref));

final ingredientStateNotifierProvider =
    StateNotifierProvider<IngredientStateNotifier, ServiceResultGenericState<List<IngredientModel>>>(
  (ref) => IngredientStateNotifier(ref.watch(ingredientServiceProvider)),
);
