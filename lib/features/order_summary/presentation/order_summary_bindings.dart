import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/features/cart/presentation/cart_controller.dart';
import 'package:prixity_ecommerce_app/core/routes/navigator.dart';
import 'package:prixity_ecommerce_app/features/order_summary/presentation/order_summary_controller.dart';

class OrderSummaryBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      OrderSummaryController(
        navigator: Get.find<INavigator>(),
        cartController: Get.find<CartController>(),
      ),
    );
  }
}
