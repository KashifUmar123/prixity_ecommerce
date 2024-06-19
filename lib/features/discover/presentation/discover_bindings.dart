import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/routes/navigator.dart';
import 'package:prixity_ecommerce_app/features/discover/presentation/discover_controller.dart';
import 'package:prixity_ecommerce_app/features/filters/presentation/filters_controller.dart';

class DiscoverBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DiscoverController(navigator: Get.find()));
    Get.put(FiltersController(navigator: Get.find<INavigator>()));
  }
}
