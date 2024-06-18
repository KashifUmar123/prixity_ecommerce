import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/features/discover/presentation/discover_controller.dart';

class DiscoverBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DiscoverController(navigator: Get.find()));
  }
}
