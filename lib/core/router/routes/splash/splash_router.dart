import 'package:go_router/go_router.dart';
import 'package:proyecto/presentation/modules/modules.dart';
import 'splash_routes.dart';

class SplashRouter {
  static GoRoute configuration = GoRoute(
    path: SplashRoutes.splash,
    builder: (_, __) => const SplashModule(),
  );
}