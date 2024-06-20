import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_button.dart';

class CustomContainerWithTitleAndButton extends StatelessWidget {
  const CustomContainerWithTitleAndButton({
    super.key,
    required this.title,
    required this.amount,
    this.isDisable = false,
    required this.btnText,
    required this.btnCallback,
  });

  final String title;
  final String amount;
  final bool isDisable;
  final String btnText;
  final VoidCallback btnCallback;

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
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: context.lable12400.copyWith(
                  color: AppColors.gray,
                ),
              ),
              5.verticalH,
              Text(
                amount,
                style: context.lable20700,
              )
            ],
          ),
          CustomButton(
            title: btnText,
            backgroundColor: AppColors.black,
            titleColor: AppColors.white,
            isDisable: isDisable,
            width: 156.w,
            onTap: btnCallback,
          )
        ],
      ),
    );
  }
}
