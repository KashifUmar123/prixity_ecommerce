import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/routes/navigator.dart';
import 'package:prixity_ecommerce_app/features/filters/presentation/filters_controller.dart';

class FiltersBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(FiltersController(navigator: Get.find<INavigator>()));
  }
}
