import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';

class CustomChipWidget extends StatelessWidget {
  const CustomChipWidget({
    super.key,
    this.selectedValue,
    required this.onChange,
    required this.value,
  });
  final String? selectedValue;
  final Function(String) onChange;
  final String value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChange.call(value),
      child: Container(
        height: 40.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(width: 1.r, color: AppColors.graySecondary),
          color: selectedValue == value ? AppColors.black : Colors.transparent,
        ),
        child: Center(
          child: Text(
            value,
            style: context.lable16600.copyWith(
              color: selectedValue == value
                  ? AppColors.white
                  : AppColors.lightBlack,
            ),
          ),
        ),
      ),
    );
  }
}
