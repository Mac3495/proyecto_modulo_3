import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:proyecto/core/utils/app_constants.dart';
import 'package:proyecto/presentation/modules/login/login_module_providers.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(loginModuleControllerProvider);
    final loginState = ref.watch(loginStateNotifierProvider);
    final isVisiblePassword = ref.watch(isVisibleLoginPasswordProvider);
    final keyFrom = ref.watch(formLoginKeyProvider);
    ref.watch(emailLoginProvider);
    ref.watch(passwordLoginProvider);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        loginState.whenOrNull(
          success: (user) => controller.goToHome(user),
          error: (e) => controller.onLoginError(context, e),
        );
      });
      return null;
    }, [loginState]);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: keyFrom,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 48),
                    child: Lottie.asset(
                      AppConstants.splashAsset,
                      repeat: false,
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Email"),
                    onChanged: controller.updateEmail,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: controller.emailValidator,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    obscureText: !isVisiblePassword,
                    onChanged: controller.updatePassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: "Contraseña",
                      suffixIcon: IconButton(
                        onPressed: () => controller.updatePasswordVisibility(!isVisiblePassword),
                        icon: Icon(
                          isVisiblePassword ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                    validator: controller.passwordValidator,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                      onPressed: controller.login,
                      child: loginState.maybeWhen(
                        loading: () => const CircularProgressIndicator(color: Colors.white),
                        orElse: () => const Text("Iniciar sesión"),
                      )),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: controller.goToSignup,
                    child: const Text(
                      "¿No tienes cuenta? Regístrate",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
