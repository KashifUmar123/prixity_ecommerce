import 'package:prixity_ecommerce_app/core/controllers/base_controller.dart';

class ReviewsController extends BaseController {
  ReviewsController({required super.navigator});

  String selectedTab = "All";

  setTab(String value) {
    selectedTab = value;
    update();
  }
}
