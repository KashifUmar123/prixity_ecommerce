import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/controllers/cart_controller.dart';
import 'package:prixity_ecommerce_app/features/product_detail/presentation/product_detail_controller.dart';

class ProductDetailBinings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductDetailController(
      navigator: Get.find(),
      cartController: Get.find<CartController>(),
    ));
  }
}
