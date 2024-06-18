import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/controllers/base_controller.dart';
import 'package:prixity_ecommerce_app/core/routes/navigator.dart';
import 'package:prixity_ecommerce_app/core/routes/routes_paths.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/model/product_entity.dart';

class ProductDetailController extends BaseController {
  ProductDetailController({required super.navigator});

  late Product product;
  late Color seletedColor;
  late num selectedSize;
  int pageIndex = 0;

  @override
  void onInit() {
    super.onInit();
    var args = Get.arguments;
    if (args != null && args is Product) {
      product = args;
      seletedColor = product.colors.first;
      selectedSize = product.sizes.first;
    }
  }

  setPageIndex(int value) {
    pageIndex = value;
    update();
  }

  setColor(Color value) {
    seletedColor = value;
    update();
  }

  setSize(num value) {
    selectedSize = value;
    update();
  }

  onSeeAllReviews() {
    Get.find<INavigator>().pushNamed(RoutePaths.reviews);
  }
}
