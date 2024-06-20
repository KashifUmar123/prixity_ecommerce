import 'package:prixity_ecommerce_app/core/controllers/base_controller.dart';
import 'package:prixity_ecommerce_app/core/utils/utils.dart';
import 'package:prixity_ecommerce_app/features/cart/presentation/cart_controller.dart';
import 'package:prixity_ecommerce_app/features/order_summary/presentation/widgets/payment_success_bottomsheet.dart';

class OrderSummaryController extends BaseController {
  OrderSummaryController({
    required super.navigator,
    required this.cartController,
  });
  final CartController cartController;

  void onPay() {
    cartController.emptyCart();
    Utils.showBottomSheet(
      isDismissible: false,
      enableDrag: false,
      child: const PaymentSuccessBottomsheet(),
    );
  }
}
