import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/constants/app_locales.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/padding_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_image.dart';
import 'package:prixity_ecommerce_app/features/filters/domain/entities/brand.dart';

class BrandsFilter extends StatelessWidget {
  const BrandsFilter({
    super.key,
    this.selectedBrand,
    required this.brands,
    required this.onTap,
  });
  final Brand? selectedBrand;
  final List<Brand> brands;
  final Function(Brand) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocales.brands.tr,
          style: context.lable16600,
        ).horizontalPadding(30.w),
        20.verticalH,
        SizedBox(
          width: context.width,
          height: 105.h,
          child: ListView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            children: [
              30.horizontalW,
              ...brands.map(
                (e) => _buildBrandItem(context, brand: e),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildBrandItem(
    BuildContext context, {
    required Brand brand,
  }) {
    return GestureDetector(
      onTap: () => onTap.call(brand),
      child: Column(
        children: [
          SizedBox(
            height: 50.w,
            width: 50.w,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    height: 50.w,
                    width: 50.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.lightBlack.withOpacity(.05),
                    ),
                    child: Center(
                      child: CustomImage(
                        imagePath: brand.iconPath,
                        height: 24.w,
                        width: 24.w,
                      ),
                    ),
                  ),
                ),
                if (brand == selectedBrand)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 20.w,
                      width: 20.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.lightBlack,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: AppColors.white,
                          size: 12.r,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          10.verticalH,
          Text(
            brand.name,
            style: context.lable14700,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "100 Items",
            style: context.lable11400,
          ),
        ],
      ).horizontalPadding(11.w),
    );
  }
}
