import 'package:prixity_ecommerce_app/core/controllers/base_controller.dart';
import 'package:prixity_ecommerce_app/features/discover/data/dummy_data.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/model/product_entity.dart';

class ReviewsController extends BaseController {
  ReviewsController({required super.navigator});
  List<Review> reviews = [];

  String selectedTab = "All";

  int selectedStar = 0;

  @override
  onInit() {
    super.onInit();
    reviews = sampleReviews;
  }

  setTab(int value) {
    selectedStar = value;
    if (value == 0) {
      reviews = sampleReviews;
    } else {
      reviews = sampleReviews
          .where((e) => e.ratings >= value && e.ratings < value + 1)
          .toList();
    }

    update();
  }
}
