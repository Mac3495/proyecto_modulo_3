import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyecto/core/providers/app_providers.dart';
import 'package:proyecto/core/router/routes/routes.dart';
import 'package:proyecto/core/utils/app_constants.dart';
import 'package:proyecto/core/utils/base_module_controller.dart';
import 'package:proyecto/data/models/models.dart';
import 'package:proyecto/presentation/modules/home/home_module_providers.dart';
import 'package:proyecto/presentation/modules/login/login_module_providers.dart';

class LoginModuleController extends BaseModuleController {
  LoginModuleController(super.ref);

  void updateEmail(String email) => ref.read(emailLoginProvider.notifier).state = email;

  void updatePassword(String pass) => ref.read(passwordLoginProvider.notifier).state = pass;

  void updatePasswordVisibility(bool value) =>
      ref.read(isVisibleLoginPasswordProvider.notifier).state = value;

  String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'El email es obligatorio';
    }
    final emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );
    if (!emailRegExp.hasMatch(value.trim())) {
      return 'Ingresa un email válido';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'La contraseña es obligatoria';
    }
    if (value.length < 6) {
      return 'Debe tener al menos 6 caracteres';
    }
    return null;
  }

  void login() {
    final formKey = ref.read(formLoginKeyProvider);
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    final userEmail = ref.read(emailLoginProvider);
    final password = ref.read(passwordLoginProvider);
    ref.read(loginStateNotifierProvider.notifier).login(userEmail, password);
  }

  void goToHome(UserModel user) async {
    final prefs = ref.read(appPreferencesProvider);
    await prefs.saveString(key: AppConstants.userId, value: user.userId.toString());
    ref.read(userProvider.notifier).state = user;
    ref.read(loginStateNotifierProvider.notifier).resetState();
    navigator.pushReplacement(HomeRoutes.home);
  }

  void goToSignup() => navigator.push(SignupRoutes.signup);

  void onLoginError(BuildContext context, String errorMessage) {
    ref.read(loginStateNotifierProvider.notifier).resetState();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage.replaceFirst('Exception: ', ''))),
    );
  }
}
