import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prixity_ecommerce_app/core/constants/images_constants.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_image.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            // TODO: navigate to cart page
          },
      child: CustomImage(
        imagePath: KImages.cart,
        width: 24.w,
        height: 24.h,
      ),
    );
  }
}
