import 'package:flutter/material.dart';
import 'package:proyecto/presentation/screens/screens.dart';

class SignupModule extends StatelessWidget {
  const SignupModule({
    super.key,
    this.rol,
  });

  final String? rol;

  @override
  Widget build(BuildContext context) {
    return SignupScreen(rol: rol);
  }
}
