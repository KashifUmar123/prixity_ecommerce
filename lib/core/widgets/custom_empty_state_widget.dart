import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/theme_extension.dart';

class CustomEmptyStateWidget extends StatelessWidget {
  const CustomEmptyStateWidget({
    super.key,
    required this.message,
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width - 60.w,
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: AppColors.white,
        border: Border.all(
          width: 1.r,
          color: AppColors.lightBlack.withOpacity(.1),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                Icons.hourglass_empty,
                color: AppColors.gray,
                size: 60.r,
              ),
            ),
          ),
          30.verticalH,
          10.verticalH,
          Text(
            message,
            style: context.lable14400,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
