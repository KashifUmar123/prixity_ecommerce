import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/constants/app_locales.dart';
import 'package:prixity_ecommerce_app/core/constants/images_constants.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_image.dart';

class DiscoverFiltersButtonWidget extends StatelessWidget {
  const DiscoverFiltersButtonWidget({
    super.key,
    required this.filtersApplied,
    required this.onFiltersTap,
  });
  final bool filtersApplied;
  final VoidCallback onFiltersTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFiltersTap,
      child: Container(
        height: 40.h,
        width: 119.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.lightBlack,
          boxShadow: const [
            BoxShadow(
              color: AppColors.gray,
              blurRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImage(
                imagePath:
                    filtersApplied ? KImages.filters : KImages.emptyFilters,
                height: 24.w,
                width: 24.w,
              ),
              12.horizontalW,
              Text(
                AppLocales.filter,
                style: context.lable14700.copyWith(
                  color: AppColors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
