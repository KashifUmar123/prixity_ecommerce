import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.width,
    this.backgroundColor = Colors.transparent,
    this.onTap,
    required this.title,
    this.titleColor = AppColors.black,
    this.height,
  });
  final double? width;
  final double? height;
  final Color backgroundColor;
  final VoidCallback? onTap;
  final String title;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 50.h,
        width: width ?? 315.w,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(width: 1.r, color: AppColors.graySecondary),
        ),
        child: Center(
          child: Text(
            title,
            style: context.lable14700.copyWith(color: titleColor),
          ),
        ),
      ),
    );
  }
}
