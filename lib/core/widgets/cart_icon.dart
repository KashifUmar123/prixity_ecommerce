import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/constants/images_constants.dart';
import 'package:prixity_ecommerce_app/core/controllers/cart_controller.dart';
import 'package:prixity_ecommerce_app/core/routes/navigator.dart';
import 'package:prixity_ecommerce_app/core/routes/routes_paths.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_image.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<CartController>(),
        builder: (controller) {
          return GestureDetector(
            onTap: onTap ??
                () {
                  Get.find<INavigator>().pushNamed(RoutePaths.cart);
                },
            child: CustomImage(
              imagePath: controller.products.isEmpty
                  ? KImages.emptyCart
                  : KImages.cart,
              width: 24.w,
              height: 24.h,
            ),
          );
        });
  }
}
