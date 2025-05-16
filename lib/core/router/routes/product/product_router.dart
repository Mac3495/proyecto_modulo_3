import 'package:go_router/go_router.dart';
import 'package:proyecto/core/router/routes/product/product_routes.dart';
import 'package:proyecto/presentation/modules/modules.dart';

class ProductRouter {
  static GoRoute configuration = GoRoute(
    path: ProductRoutes.product,
    builder: (_, __) => const ProductModule(),
  );
}