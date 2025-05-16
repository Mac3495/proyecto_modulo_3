import 'dart:io';

import 'package:flutter/material.dart';
import 'package:proyecto/core/utils/base_module_controller.dart';
import 'package:proyecto/presentation/modules/home/home_module_providers.dart';
import 'package:proyecto/presentation/modules/home/scanner/scanner_module_providers.dart';

class ScannerModuleController extends BaseModuleController {
  ScannerModuleController(super.ref);

  void takePhoto() {
    print('Tomar foto');
    ref.read(scannerStateNotifierProvider.notifier).captureImage();
  }

  void verifyProduct(File file) {
    final userId = ref.read(userProvider)?.userId;
    ref.read(scannerVerifyStateNotifierProvider.notifier).verifyProduct(file, userId.toString());
  }

  void clearStates() {
    ref.read(scannerStateNotifierProvider.notifier).clearStates();
    ref.read(scannerVerifyStateNotifierProvider.notifier).clearStates();
    navigator.pop();
  }

  void showVerifyDialog(BuildContext context, File file, Widget content) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: content,
        );
      },
    );
  }
}
