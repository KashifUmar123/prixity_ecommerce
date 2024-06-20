import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/padding_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';
import 'package:prixity_ecommerce_app/features/cart/cart_controller.dart';

class OrderPaymentDetailsBlock extends StatelessWidget {
  const OrderPaymentDetailsBlock({super.key, required this.cartController});
  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Payment Detail",
          style: context.lable18700,
        ),
        20.verticalH,
        _buildRowContent(
          context,
          title: "Sub Total",
          amount: cartController.totalPrice,
        ),
        20.verticalH,
        _buildRowContent(
          context,
          title: "Shipping",
          amount: cartController.shippingCost,
        ),
        20.verticalH,
        _buildRowContent(
          context,
          title: "Total Order",
          amount: cartController.shippingCost + cartController.totalPrice,
        ),
      ],
    ).horizontalPadding(30.w);
  }

  Widget _buildRowContent(
    BuildContext context, {
    required String title,
    required num amount,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.lable14400.copyWith(
            color: AppColors.secondaryDargGray,
          ),
        ),
        Text(
          "\$$amount",
          style: context.lable16600,
        ),
      ],
    );
  }
}
