// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:prixity_ecommerce_app/core/controllers/base_controller.dart';
import 'package:prixity_ecommerce_app/core/routes/routes_paths.dart';
import 'package:prixity_ecommerce_app/core/utils/utils.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/model/product_entity.dart';
import 'package:prixity_ecommerce_app/features/product_detail/presentation/widgets/product_added_bottomsheet.dart';

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

  num shippingCost = 20;

  addProduct(CartProduct product) {
    products.insert(0, product);
    update();
    navigator.pop();
    _showProductAddedBottomsheet();
  }

  removeProduct(CartProduct product) {
    products.remove(product);
    update();
  }

  incrementQuantity(CartProduct product) {
    product.params.quantity++;
    update();
  }

  decrementQuantity(CartProduct product) {
    product.params.quantity--;
    update();
  }

  _showProductAddedBottomsheet() {
    Utils.showBottomSheet(
      child: const ProductAddedBottomsheer(),
    );
  }

  onCheckout() {
    navigator.pushNamed(RoutePaths.orderSummary);
  }

  emptyCart() {
    products = [];
    update();
  }

  double get totalPrice {
    double total = 0;
    for (var element in products) {
      total += (element.product.price * element.params.quantity);
    }
    return total;
  }
}
