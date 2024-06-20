import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/constants/app_locales.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';
import 'package:prixity_ecommerce_app/core/routes/navigator.dart';
import 'package:prixity_ecommerce_app/core/routes/routes_paths.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_button.dart';

class ProductAddedBottomsheer extends StatelessWidget {
  const ProductAddedBottomsheer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100.w,
          width: 100.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 3.r,
              color: AppColors.lightBlack,
            ),
          ),
          child: Center(
            child: Icon(
              Icons.check,
              color: AppColors.gray,
              size: 60.r,
            ),
          ),
        ),
        20.verticalH,
        Text(
          AppLocales.addedToCart.tr,
          style: context.lable16600.copyWith(
            fontSize: 24.sp,
          ),
        ),
        5.verticalH,
        Text(
          "1 ${AppLocales.itemTotal.tr}",
          style: context.lable14400.copyWith(
            color: AppColors.grayInCartAddedBottomsheet,
          ),
        ),
        20.verticalH,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              title: AppLocales.backExplore.tr,
              width: 150.w,
              onTap: () {
                Get.find<INavigator>().pop();
                Get.find<INavigator>().pop();
              },
            ),
            CustomButton(
              title: AppLocales.toCart.tr,
              backgroundColor: AppColors.black,
              titleColor: AppColors.white,
              width: 150.w,
              onTap: () {
                Get.find<INavigator>().pop();
                Get.find<INavigator>().pushNamed(RoutePaths.cart);
              },
            )
          ],
        ),
      ],
    );
  }
}
