import 'dart:io';

import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyecto/data/models/common/service_result_generic_state.dart';
import 'package:proyecto/data/services/ingredient/ingredient_service.dart';

class ScannerStateNotifier extends StateNotifier<ServiceResultGenericState<File>> {
  ScannerStateNotifier(this._picker) : super(const ServiceResultGenericState.init());

  final ImagePicker _picker;

  Future<void> captureImage() async {
    state = const ServiceResultGenericState.loading();
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile == null) {
        state = const ServiceResultGenericState.error("No se seleccionó ninguna imagen");
        return;
      }

      state = ServiceResultGenericState.success(File(pickedFile.path));
    } catch (e) {
      state = ServiceResultGenericState.error("Error al capturar imagen: $e");
    }
  }

  void clearStates() => state = const ServiceResultGenericState.init();
}

class ScannerVerifyStateNotifier extends StateNotifier<ServiceResultGenericState<void>> {
  ScannerVerifyStateNotifier(this._ingredientService)
      : super(const ServiceResultGenericState.init());

  final IngredientService _ingredientService;

  Future<void> verifyProduct(File file, String userId) async {
    state = const ServiceResultGenericState.loading();
    await Future.delayed(const Duration(seconds: 3));

    try {
      final ingredients = await _ingredientService.getAllIngredients(userId);
      final ingredientNames = ingredients.map((e) => e.name.toLowerCase()).toSet();

      final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
      final inputImage = InputImage.fromFile(file);
      final recognizedText = await textRecognizer.processImage(inputImage);

      for (final block in recognizedText.blocks) {
        for (final line in block.lines) {
          for (final element in line.elements) {
            final cleanText = element.text.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();

            print("Reconocido: ${element.text} → Limpio: $cleanText");

            if (ingredientNames.contains(cleanText)) {
              state = ServiceResultGenericState.error("Este producto tiene $cleanText");
              return;
            }
          }
        }
      }

      state = const ServiceResultGenericState.success(null);
    } catch (e) {
      state = ServiceResultGenericState.error("Error al verificar: $e");
    }
  }

  void clearStates() => state = const ServiceResultGenericState.init();
}
