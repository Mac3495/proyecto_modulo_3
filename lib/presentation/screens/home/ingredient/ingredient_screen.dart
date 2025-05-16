import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:proyecto/core/utils/app_constants.dart';
import 'package:proyecto/presentation/modules/home/home_module_providers.dart';
import 'package:proyecto/presentation/modules/home/ingredient/ingredient_module_providers.dart';
import 'package:proyecto/presentation/modules/product/product_providers.dart';

class IngredientScreen extends HookConsumerWidget {
  const IngredientScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(userProvider)?.userId;
    final controller = ref.watch(ingredientModuleController);
    final ingredientsState = ref.watch(ingredientStateNotifierProvider);
    final productState = ref.watch(productStateNotifierProvider);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.getProducts(userId.toString());
      });

      return null;
    }, []);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        productState.whenOrNull(
          success: (data) => controller.getProducts(userId.toString()),
          error: (e) => controller.onError(context, e),
        );
      });
      return null;
    }, [productState]);

    return SafeArea(
      child: ingredientsState.when(
        init: () => const SizedBox(),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e) => Center(child: Text("Error: $e")),
        success: (ingredients) {
          if (ingredients.isEmpty) {
            return Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 64,
                        vertical: 24,
                      ),
                      child: LottieBuilder.asset(AppConstants.splashAsset),
                    ),
                    const Center(child: Text("No hay productos aún")),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: FloatingActionButton(
                      onPressed: controller.goToCreateProduct,
                      child: const Icon(Icons.add),
                    ),
                  ),
                ),
              ],
            );
          }
          return Stack(
            children: [
              ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: ingredients.length,
                itemBuilder: (_, index) {
                  final product = ingredients[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      title: Text(product.name),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'edit') {
                            // TODO: Navegar a editar
                          } else if (value == 'delete') {
                            controller.deleteIngredient(product.id);
                          }
                        },
                        itemBuilder: (_) => [
                          const PopupMenuItem(value: 'edit', child: Text('Editar')),
                          const PopupMenuItem(value: 'delete', child: Text('Eliminar')),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: FloatingActionButton(
                    onPressed: controller.goToCreateProduct,
                    child: const Icon(Icons.add),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
