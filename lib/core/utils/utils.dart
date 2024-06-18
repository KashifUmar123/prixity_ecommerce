import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';

class Utils {
  static bool isColorLighterThanGray(Color color) {
    double luminance = color.computeLuminance();
    double threshold = 0.7;
    return luminance > threshold;
  }

  static void showBottomSheet({
    Color? backgroundColor,
    bool enableDrag = true,
    bool isDismissible = true,
    double? height,
    required Widget child,
  }) {
    Get.bottomSheet(
      Container(
        height: height ?? Get.height * .4,
        width: Get.width,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        padding: EdgeInsetsDirectional.symmetric(
          vertical: 16.h + 24.h,
          horizontal: 30.w,
        ),
        child: child,
      ),
      backgroundColor: backgroundColor,
      enableDrag: enableDrag,
      isDismissible: isDismissible,
    );
  }
}
