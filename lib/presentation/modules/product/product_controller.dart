import 'package:flutter/material.dart';
import 'package:proyecto/core/utils/base_module_controller.dart';
import 'package:proyecto/data/models/models.dart';
import 'package:proyecto/presentation/modules/home/ingredient/ingredient_module_providers.dart';
import 'package:proyecto/presentation/modules/product/product_providers.dart';

class ProductModuleController extends BaseModuleController {
  ProductModuleController(super.ref);

  void updateIngredientName(String name) => ref.read(ingredientNameProvider.notifier).state = name;

  void goToIngredients(String userId) {
    ref.read(ingredientStateNotifierProvider.notifier).getIngredients(userId);
    ref.read(productStateNotifierProvider.notifier).resetState();
    navigator.pop();
  }

  void createIngredient(String userId) {
    final formKey = ref.read(formProductKeyProvider);
    if (formKey.currentState!.validate()) {
      final ingredient = IngredientModel(
        name: ref.read(ingredientNameProvider),
        userId: userId,
      );
      ref.read(productStateNotifierProvider.notifier).createIngredients(ingredient);
    }
  }

  void onLoginError(BuildContext context, String errorMessage) {
    ref.read(productStateNotifierProvider.notifier).resetState();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage.replaceFirst('Exception: ', ''))),
    );
  }
}
