import 'package:prixity_ecommerce_app/core/controllers/base_controller.dart';
import 'package:prixity_ecommerce_app/core/routes/routes_paths.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/model/product_entity.dart';

class DiscoverController extends BaseController {
  DiscoverController({required super.navigator});

  // brands
  final List<String> brands = [
    "All",
    "Nike",
    "Jordan",
    "Adidas",
    "Reebok",
  ];

  // selected brand
  late String selectedBrand;

  @override
  void onInit() {
    super.onInit();
    selectedBrand = brands.first;
  }

  void setBrand(String value) {
    selectedBrand = value;
    update();
  }

  void onProductTap(Product product) {
    navigator.pushNamed(RoutePaths.productDetail, arguments: product);
  }

  void onCartTap() {
    navigator.pushNamed(RoutePaths.cart);
  }
}
