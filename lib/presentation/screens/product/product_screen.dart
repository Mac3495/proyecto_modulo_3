import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:proyecto/core/utils/app_constants.dart';
import 'package:proyecto/presentation/modules/home/home_module_providers.dart';
import 'package:proyecto/presentation/modules/product/product_providers.dart';

class ProductScreen extends HookConsumerWidget {
  const ProductScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(productControllerProvider);
    final userId = ref.read(userProvider)?.userId.toString();
    final productState = ref.watch(productStateNotifierProvider);
    final formKey = ref.watch(formProductKeyProvider);
    ref.watch(ingredientNameProvider);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        productState.whenOrNull(
          success: (data) => controller.goToIngredients(userId ?? ''),
          error: (e) => controller.onLoginError(context, e),
        );
      });
      return null;
    }, [productState]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar ingrediente'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 48),
                  child: LottieBuilder.asset(
                    AppConstants.splashAsset,
                    repeat: false,
                    height: 200,
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Nombre del ingrediente",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: controller.updateIngredientName,
                  validator: (value) =>
                      value == null || value.trim().isEmpty ? "Campo obligatorio" : null,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => controller.createIngredient(userId ?? ''),
                  child: productState.maybeWhen(
                    loading: () => const CircularProgressIndicator(color: Colors.white),
                    orElse: () => const Text("Agregar"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
