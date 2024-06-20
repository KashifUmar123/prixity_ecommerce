import 'package:prixity_ecommerce_app/features/cart/entities/product_params.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/model/product_entity.dart';

class CartProduct {
  Product product;
  ProductParams params;

  CartProduct({
    required this.params,
    required this.product,
  });
}
