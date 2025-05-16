import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:proyecto/core/utils/app_constants.dart';
import 'package:proyecto/presentation/modules/home/scanner/scanner_module_providers.dart';

class VerifyContent extends HookConsumerWidget {
  const VerifyContent({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(scannerModuleControllerProvider);
    final verifyState = ref.watch(scannerVerifyStateNotifierProvider);

    return verifyState.when(
      init: () => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(AppConstants.scanAsset),
          const SizedBox(height: 16),
          const Text("Verificando producto..."),
        ],
      ),
      loading: () => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(AppConstants.scanAsset),
          const SizedBox(height: 16),
          const Text("Verificando producto..."),
        ],
      ),
      success: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(AppConstants.checkAsset),
          const SizedBox(height: 16),
          const Text("Producto verificado con éxito"),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: controller.clearStates,
            child: const Text("Aceptar"),
          ),
        ],
      ),
      error: (e) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error, color: Colors.red, size: 64),
          const SizedBox(height: 16),
          Text(e, textAlign: TextAlign.center),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: controller.clearStates,
            child: const Text("Aceptar"),
          )
        ],
      ),
    );
  }
}
