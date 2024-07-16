import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    splashColor: Colors.transparent,
    primaryColor: AppColors.red,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.light(
      surface: AppColors.white,
      brightness: Brightness.light,
      error: AppColors.red,
      errorContainer: AppColors.white,
      primary: AppColors.red,
      onPrimary: AppColors.white,
      secondary: AppColors.yellow,
      onSecondary: AppColors.white,
      outline: AppColors.gray,
      outlineVariant: AppColors.gray.withOpacity(.5),
    ),
    scaffoldBackgroundColor: AppColors.white,
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.red,
      disabledColor: AppColors.red.withOpacity(.5),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.red,
        disabledBackgroundColor: AppColors.red.withOpacity(.5),
        foregroundColor: AppColors.white,
        disabledForegroundColor: AppColors.white.withOpacity(.7),
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
        textStyle: GoogleFonts.poppins(
          color: AppColors.white,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    ),
    textTheme: GoogleFonts.poppinsTextTheme(
      TextTheme(
        displayLarge: TextStyle(
          color: AppColors.textColor,
          fontWeight: FontWeight.w800,
          fontSize: 32.sp,
        ),
        displayMedium: TextStyle(
          color: AppColors.textColor,
          fontWeight: FontWeight.w800,
          fontSize: 24.sp,
        ),
        displaySmall: TextStyle(
          color: AppColors.textColor,
          fontWeight: FontWeight.w700,
          fontSize: 20.sp,
        ),
        headlineLarge: TextStyle(
          color: AppColors.textColor,
          fontWeight: FontWeight.w700,
          fontSize: 18.sp,
        ),
        headlineMedium: TextStyle(
          color: AppColors.textColor,
          fontWeight: FontWeight.w700,
          fontSize: 16.sp,
        ),
        headlineSmall: TextStyle(
          color: AppColors.textColor,
          fontWeight: FontWeight.w700,
          fontSize: 14.sp,
        ),
        bodyLarge: TextStyle(
          color: AppColors.textColor,
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
        ),
        bodyMedium: TextStyle(
          color: AppColors.textColor,
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
        ),
        bodySmall: TextStyle(
          color: AppColors.textColor,
          fontWeight: FontWeight.w400,
          fontSize: 12.sp,
        ),
        labelLarge: TextStyle(
          color: AppColors.textColor,
          fontWeight: FontWeight.w700,
          fontSize: 12.sp,
        ),
        labelMedium: TextStyle(
          color: AppColors.textColor,
          fontWeight: FontWeight.w500,
          fontSize: 10.sp,
        ),
        labelSmall: TextStyle(
          color: AppColors.textColor,
          fontWeight: FontWeight.w500,
          fontSize: 8.sp,
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      // fillColor: MaterialStateProperty.all(AppColors.red),
      checkColor: WidgetStateProperty.all(AppColors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.r),
      ),
      side: BorderSide(
        color: AppColors.textColor,
        width: 1.w,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.transparent,
        disabledBackgroundColor: Colors.transparent,
        foregroundColor: AppColors.red,
        disabledForegroundColor: AppColors.red.withOpacity(.5),
        padding: EdgeInsets.symmetric(vertical: 15.r, horizontal: 10.r),
        side: const BorderSide(
          color: AppColors.red,
          width: 1,
        ),
        textStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 20.sp,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        alignment: Alignment.center,
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.red.withOpacity(.05),
      showCheckmark: false,
      side: BorderSide.none,
      disabledColor: AppColors.gray,
      labelStyle: GoogleFonts.poppins(
        color: AppColors.red,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
      selectedColor: AppColors.red.withOpacity(.05),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      elevation: 10,
      selectedItemColor: AppColors.red,
      unselectedItemColor: AppColors.gray,
      selectedIconTheme: const IconThemeData(color: AppColors.red),
      unselectedIconTheme: const IconThemeData(color: AppColors.gray),
      showUnselectedLabels: true,
      selectedLabelStyle: GoogleFonts.poppins(
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      unselectedLabelStyle: GoogleFonts.poppins(
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      type: BottomNavigationBarType.fixed,
    ),
    useMaterial3: true,
  );
}
