import 'package:go_router/go_router.dart';
import 'package:proyecto/core/router/routes/home/home_routes.dart';
import 'package:proyecto/presentation/modules/modules.dart';

class HomeRouter {
  static GoRoute configuration = GoRoute(
    path: HomeRoutes.home,
    builder: (_, __) => const HomeModule(),
  );
}