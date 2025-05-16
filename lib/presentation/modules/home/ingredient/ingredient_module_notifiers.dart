import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proyecto/data/models/common/service_result_generic_state.dart';
import 'package:proyecto/data/models/models.dart';
import 'package:proyecto/data/services/ingredient/ingredient_service.dart';

class IngredientStateNotifier extends StateNotifier<ServiceResultGenericState<List<IngredientModel>>> {
  IngredientStateNotifier(this._ingredientService)
      : super(const ServiceResultGenericState.init());

  final IngredientService _ingredientService;

  Future<void> getIngredients(String userId) async {
    state = const ServiceResultGenericState.loading();

    try {
      final ingredients = await _ingredientService.getAllIngredients(userId);
      state = ServiceResultGenericState.success(ingredients);
    } catch (e) {
      state = ServiceResultGenericState.error(e.toString());
    }
  }
}
