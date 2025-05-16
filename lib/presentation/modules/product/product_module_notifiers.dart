import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proyecto/data/models/common/service_result_generic_state.dart';
import 'package:proyecto/data/models/models.dart';
import 'package:proyecto/data/services/ingredient/ingredient_service.dart';

class ProductStateNotifier extends StateNotifier<ServiceResultGenericState<void>> {
  ProductStateNotifier(this._ingredientService)
      : super(const ServiceResultGenericState.init());

  final IngredientService _ingredientService;

  Future<void> createIngredients(IngredientModel ingredient) async {
    state = const ServiceResultGenericState.loading();

    try {
      await _ingredientService.createIngredient(ingredient);
      state = const ServiceResultGenericState.success(null);
    } catch (e) {
      state = ServiceResultGenericState.error(e.toString());
    }
  }

  Future<void> deleteIngredient(int id) async {
    state = const ServiceResultGenericState.loading();

    try {
      await _ingredientService.deleteIngredient(id);
      state = const ServiceResultGenericState.success(null);
    } catch (e) {
      state = ServiceResultGenericState.error(e.toString());
    }
  }

  void resetState() => state = const ServiceResultGenericState.init();
}
