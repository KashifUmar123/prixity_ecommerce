import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';
import 'package:prixity_ecommerce_app/core/routes/navigator.dart';
import 'package:prixity_ecommerce_app/core/routes/routes_paths.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_button.dart';

class PaymentSuccessBottomsheet extends StatelessWidget {
  const PaymentSuccessBottomsheet({super.key});

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
          "Payment Successfull",
          style: context.lable16600,
        ),
        10.verticalH,
        Text(
          "Your order has been placed",
          style: context.lable14400,
        ),
        20.verticalH,
        CustomButton(
          title: "Go Back",
          backgroundColor: AppColors.lightBlack,
          titleColor: AppColors.white,
          width: 200.w,
          onTap: () {
            Get.find<INavigator>().pushReplacementNamed(RoutePaths.discover);
          },
        ),
      ],
    );
  }
}
