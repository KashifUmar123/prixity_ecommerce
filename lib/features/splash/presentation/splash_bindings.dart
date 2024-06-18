import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/routes/navigator.dart';
import 'package:prixity_ecommerce_app/features/splash/presentation/splash_controller.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController(navigator: Get.find<INavigator>()));
  }
}
