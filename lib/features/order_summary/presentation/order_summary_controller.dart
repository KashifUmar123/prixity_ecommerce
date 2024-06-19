import 'package:prixity_ecommerce_app/core/controllers/base_controller.dart';
import 'package:prixity_ecommerce_app/core/controllers/cart_controller.dart';

class OrderSummaryController extends BaseController {
  OrderSummaryController({
    required super.navigator,
    required this.cartController,
  });
  final CartController cartController;
}
