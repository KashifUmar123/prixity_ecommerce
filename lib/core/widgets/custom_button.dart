import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.width,
    this.backgroundColor,
    this.onTap,
    required this.title,
    this.titleColor = AppColors.black,
    this.height,
    this.isDisable = false,
  });
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final String title;
  final Color titleColor;
  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !isDisable ? onTap : null,
      child: Container(
        height: height ?? 50.h,
        width: width ?? 315.w,
        decoration: BoxDecoration(
          color: backgroundColor?.withOpacity(isDisable ? 0.7 : 1),
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
