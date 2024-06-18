import 'dart:io';
import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:animated_list_plus/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/controllers/cart_controller.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_button.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_scaffold.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Column(
          children: [
            Expanded(
              child: ImplicitlyAnimatedList<CartProduct>(
                items: controller.products,
                areItemsTheSame: (a, b) => a.product.id == b.product.id,
                itemBuilder: (context, animation, item, index) {
                  return SizeFadeTransition(
                    sizeFraction: 0.7,
                    curve: Curves.easeInOut,
                    animation: animation,
                    child: Text(item.product.name),
                  );
                },
                removeItemBuilder: (context, animation, oldItem) {
                  return FadeTransition(
                    opacity: animation,
                    child: Text(oldItem.product.name),
                  );
                },
              ),
            ),
            Container(
              height: Platform.isIOS ? 110.h : 90.h,
              width: double.infinity,
              padding: EdgeInsetsDirectional.only(
                start: 30.w,
                end: 30.w,
                top: 17.h,
              ),
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Grand Total",
                        style: context.lable12400.copyWith(
                          color: AppColors.gray,
                        ),
                      ),
                      5.verticalH,
                      Text(
                        "\$2500",
                        style: context.lable20700,
                      )
                    ],
                  ),
                  CustomButton(
                    title: "ADD TO CART",
                    backgroundColor: AppColors.black,
                    titleColor: AppColors.white,
                    width: 156.w,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
