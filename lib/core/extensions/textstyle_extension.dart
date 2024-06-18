import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';

extension TextstyleExtension on BuildContext {
  TextStyle get lable12400 => GoogleFonts.urbanist(
        textStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.lightBlack,
        ),
      );

  TextStyle get lable30700 => GoogleFonts.urbanist(
        textStyle: TextStyle(
          fontSize: 30.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.lightBlack,
        ),
      );

  TextStyle get lable20700 => GoogleFonts.urbanist(
        textStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.lightBlack,
        ),
      );

  TextStyle get lable11700 => GoogleFonts.urbanist(
        textStyle: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.lightBlack,
        ),
      );
  TextStyle get lable11400 => GoogleFonts.urbanist(
        textStyle: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.lightBlack,
        ),
      );

  TextStyle get lable14700 => GoogleFonts.urbanist(
        textStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.lightBlack,
        ),
      );

  TextStyle get lable16600 => GoogleFonts.urbanist(
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.lightBlack,
        ),
      );

  TextStyle get lable14400 => GoogleFonts.urbanist(
        textStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.lightBlack,
        ),
      );
}
