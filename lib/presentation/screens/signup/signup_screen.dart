import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proyecto/data/models/models.dart';
import 'package:proyecto/presentation/modules/signup/signup_module_providers.dart';

class SignupScreen extends HookConsumerWidget {
  const SignupScreen({
    super.key,
    this.rol,
  });

  final String? rol;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(signupModuleController);
    final signupState = ref.watch(signupStateNotifierProvider);
    final isVisiblePassword = ref.watch(isVisiblePasswordProvider);
    final formKey = ref.watch(formKeyProvider);
    ref.watch(nameProvider);
    ref.watch(emailProvider);
    ref.watch(passwordProvider);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (signupState.state == SignupStates.success) {
          controller.goToHome();
        }
      });

      return null;
    }, [signupState]);

    return Scaffold(
      appBar: AppBar(title: const Text("Registro de usuario")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Nombre"),
                onChanged: controller.updateName,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: controller.nameValidator,
              ),
              const SizedBox(height: 12),
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
                onPressed: () => controller.saveUser(rol ?? 'client'),
                child: const Text("Registrar y continuar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
