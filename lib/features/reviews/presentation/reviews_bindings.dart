import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/routes/navigator.dart';
import 'package:prixity_ecommerce_app/features/reviews/presentation/reviews_controller.dart';

class ReviewsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      ReviewsController(
        navigator: Get.find<INavigator>(),
      ),
    );
  }
}
