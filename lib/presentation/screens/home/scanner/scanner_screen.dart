import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:proyecto/core/utils/app_constants.dart';
import 'package:proyecto/presentation/modules/home/scanner/scanner_module_providers.dart';
import 'package:proyecto/presentation/screens/home/scanner/widgets/verify_content.dart';

class ScannerScreen extends HookConsumerWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scannerState = ref.watch(scannerStateNotifierProvider);
    final controller = ref.read(scannerModuleControllerProvider);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: scannerState.when(
              init: () => GestureDetector(
                onTap: controller.takePhoto,
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt_rounded, size: 100, color: Colors.grey[600]),
                          const SizedBox(height: 16),
                          Text(
                            'Toca para escanear un ingrediente',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(child: LottieBuilder.asset(AppConstants.starsAsset)),
                    Center(child: LottieBuilder.asset(AppConstants.particlesAsset)),
                  ],
                ),
              ),
              loading: () => const CircularProgressIndicator(),
              success: (file) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.file(
                      file,
                      width: 220,
                      height: 220,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      controller.verifyProduct(file);
                      controller.showVerifyDialog(context, file, const VerifyContent());
                    },
                    icon: const Icon(Icons.check_circle),
                    label: const Text("Verificar"),
                  ),
                ],
              ),
              error: (e) => GestureDetector(
                onTap: controller.takePhoto,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LottieBuilder.asset(AppConstants.cameraAsset),
                    const SizedBox(height: 16),
                    Text(
                      'Ocurrió un error. Toca para volver a intentar',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
