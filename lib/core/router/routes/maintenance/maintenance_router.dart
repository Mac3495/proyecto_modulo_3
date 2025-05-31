import 'package:go_router/go_router.dart';
import 'package:proyecto/core/router/routes/maintenance/maintenance_routes.dart';
import 'package:proyecto/presentation/modules/maintenance/maintenance_module.dart';

class MaintenanceRouter {
  static GoRoute configuration = GoRoute(
    path: MaintenanceRoutes.maintenance,
    builder: (_, __) => const MaintenanceModule(),
  );
}