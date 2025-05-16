import 'package:flutter/material.dart';
import 'package:proyecto/core/router/routes/product/product_routes.dart';
import 'package:proyecto/core/utils/base_module_controller.dart';
import 'package:proyecto/presentation/modules/home/ingredient/ingredient_module_providers.dart';
import 'package:proyecto/presentation/modules/login/login_module_providers.dart';
import 'package:proyecto/presentation/modules/product/product_providers.dart';

class IngredientModuleController extends BaseModuleController {
  IngredientModuleController(super.ref);

  void getProducts(String userId) =>
      ref.read(ingredientStateNotifierProvider.notifier).getIngredients(userId);

  void deleteIngredient(int? id) {
    if (id == null) return;
    ref.read(productStateNotifierProvider.notifier).deleteIngredient(id);
  }

  void goToCreateProduct() => navigator.push(ProductRoutes.product);

  void onError(BuildContext context, String errorMessage) {
    ref.read(loginStateNotifierProvider.notifier).resetState();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage.replaceFirst('Exception: ', ''))),
    );
  }
}
