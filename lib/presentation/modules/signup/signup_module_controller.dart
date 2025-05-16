import 'package:proyecto/core/router/routes/routes.dart';
import 'package:proyecto/core/utils/base_module_controller.dart';
import 'package:proyecto/data/models/models.dart';
import 'package:proyecto/presentation/modules/home/home_module_providers.dart';
import 'package:proyecto/presentation/modules/signup/signup_module_providers.dart';

class SignupModuleController extends BaseModuleController {
  SignupModuleController(super.ref);

  void updateName(String name) => ref.read(nameProvider.notifier).state = name;

  void updateEmail(String email) => ref.read(emailProvider.notifier).state = email;

  void updatePassword(String pass) => ref.read(passwordProvider.notifier).state = pass;

  void updatePasswordVisibility(bool value) =>
      ref.read(isVisiblePasswordProvider.notifier).state = value;

  String? nameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'El nombre es obligatorio';
    }
    final nameRegExp = RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$');
    if (!nameRegExp.hasMatch(value.trim())) {
      return 'Solo se permiten letras';
    }
    return null;
  }

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

  void saveUser(String rol) {
    final formKey = ref.read(formKeyProvider);
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    final user = UserModel(
      userName: ref.read(nameProvider),
      userEmail: ref.read(emailProvider),
      password: ref.read(passwordProvider),
      rol: rol,
    );

    ref.read(userProvider.notifier).state = user;
    ref.read(signupStateNotifierProvider.notifier).createUser(user);
  }

  void goToHome() {
    ref.read(signupStateNotifierProvider.notifier).resetState();
    navigator.pushReplacement(HomeRoutes.home);
  }
}
