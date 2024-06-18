// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:prixity_ecommerce_app/core/controllers/base_controller.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/model/product_entity.dart';

class ProductParams {
  int quantity;
  String color;
  num size;

  ProductParams({
    this.quantity = 1,
    required this.color,
    required this.size,
  });
}

class CartProduct {
  Product product;
  ProductParams params;

  CartProduct({
    required this.params,
    required this.product,
  });
}

class CartController extends BaseController {
  CartController({required super.navigator});
  List<CartProduct> products = [];

  addProduct(CartProduct product) {
    products.insert(0, product);
    update();
  }

  removeProduct(CartProduct product) {
    products.remove(product);
    update();
  }

  double get totalPrice {
    double total = 0;
    for (var element in products) {
      total += element.product.price;
    }
    return total;
  }
}
