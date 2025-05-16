import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto/core/router/routes/signup/signup_routes.dart';
import 'package:proyecto/presentation/modules/modules.dart';

class SignupRouter {
  static Widget _signupScreenHandler(GoRouterState state) {
    final rol = state.extra as String?;
    return SignupModule(rol: rol);
  }

  static GoRoute configuration = GoRoute(
    path: SignupRoutes.signup,
    builder: (_, state) => _signupScreenHandler(state),
  );
}
