import 'package:go_router/go_router.dart';
import 'package:proyecto/core/router/routes/login/login_routes.dart';
import 'package:proyecto/presentation/modules/modules.dart';

class LoginRouter {
  static GoRoute configuration = GoRoute(
    path: LoginRoutes.login,
    builder: (_, __) => const LoginModule(),
  );
}