import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proyecto/core/router/routes/product/product_router.dart';
import 'package:proyecto/core/router/routes/routes.dart';

final appRouterProvider = Provider.autoDispose<GoRouter>(
  (ref) => GoRouter(
    initialLocation: SplashRoutes.splash,
    routes: [
      SplashRouter.configuration,
      SignupRouter.configuration,
      HomeRouter.configuration,
      LoginRouter.configuration,
      ProductRouter.configuration,
      MaintenanceRouter.configuration,
    ],
    onException: (_, __, ___) {},
  ),
);