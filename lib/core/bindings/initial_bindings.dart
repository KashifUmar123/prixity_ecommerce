import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/features/cart/presentation/cart_controller.dart';
import 'package:prixity_ecommerce_app/core/routes/navigator.dart';

class InitalBindings {
  static Future<void> initialize() async {
    // firebase initialization
    await Firebase.initializeApp();

    // put navigator
    Get.lazyPut<INavigator>(() => NavigatorImpl());

    // put cart controller
    Get.put(
      CartController(navigator: Get.find<INavigator>()),
      permanent: true,
    );
  }
}
