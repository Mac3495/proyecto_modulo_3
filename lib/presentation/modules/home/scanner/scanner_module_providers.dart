import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyecto/data/models/common/service_result_generic_state.dart';
import 'package:proyecto/data/services/service_providers.dart';
import 'package:proyecto/presentation/modules/home/scanner/scanner_module_controller.dart';
import 'package:proyecto/presentation/modules/home/scanner/scanner_module_notifiers.dart';

final scannerModuleControllerProvider =
    Provider<ScannerModuleController>((ref) => ScannerModuleController(ref));

final imagePickerProvider = Provider<ImagePicker>((ref) => ImagePicker());

final scannerStateNotifierProvider =
    StateNotifierProvider<ScannerStateNotifier, ServiceResultGenericState<File>>(
  (ref) => ScannerStateNotifier(ref.watch(imagePickerProvider)),
);

final scannerVerifyStateNotifierProvider =
    StateNotifierProvider<ScannerVerifyStateNotifier, ServiceResultGenericState<void>>(
  (ref) => ScannerVerifyStateNotifier(ref.watch(ingredientServiceProvider)),
);