import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/constants/app_locales.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_button.dart';

class FilterButtons extends StatelessWidget {
  const FilterButtons({
    super.key,
    required this.onResset,
    required this.onApply,
    required this.resetText,
    this.applyText,
  });

  final VoidCallback onResset;
  final VoidCallback onApply;
  final String resetText;
  final String? applyText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Platform.isIOS ? 110.h : 90.h,
      width: double.infinity,
      padding: EdgeInsetsDirectional.only(
        start: 30.w,
        end: 30.w,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButton(
            title: resetText,
            width: 150.w,
            onTap: onResset,
          ),
          CustomButton(
            title: applyText ?? AppLocales.apply.tr,
            backgroundColor: AppColors.black,
            titleColor: AppColors.white,
            width: 150.w,
            onTap: onApply,
          )
        ],
      ),
    );
  }
}
