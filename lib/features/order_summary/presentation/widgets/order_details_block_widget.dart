import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/constants/app_locales.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/padding_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';
import 'package:prixity_ecommerce_app/features/cart/entities/cart_prodcut.dart';
import 'package:prixity_ecommerce_app/features/cart/presentation/cart_controller.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/model/product_entity.dart';

class OrderDetailsBlock extends StatelessWidget {
  const OrderDetailsBlock({super.key, required this.cartController});
  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocales.orderDetail.tr,
          style: context.lable18700,
        ),
        ...cartController.products.map(
          (e) => _buildOrderItem(context, cartProduct: e),
        ),
      ],
    ).horizontalPadding(30.w);
  }

  _buildOrderItem(BuildContext context, {required CartProduct cartProduct}) {
    Product product = cartProduct.product;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cartProduct.product.name,
          style: context.lable16600,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        10.verticalH,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "${product.brand.name} . ${cartProduct.params.color} . ${cartProduct.params.size} . Qty ${cartProduct.params.quantity}",
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              "\$${cartProduct.params.quantity * product.price}",
              style: context.lable14700,
            )
          ],
        ),
      ],
    ).topPadding(20.h);
  }
}
