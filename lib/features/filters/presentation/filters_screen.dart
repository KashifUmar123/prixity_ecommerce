import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/padding_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_appbar.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_button.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_image.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_scaffold.dart';
import 'package:prixity_ecommerce_app/features/filters/domain/entities/brand.dart';
import 'package:prixity_ecommerce_app/features/filters/presentation/filters_controller.dart';

class FiltersScreen extends GetView<FiltersController> {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: GetBuilder(
          init: controller,
          builder: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                70.verticalH,
                const CustomAppbar(
                  title: "Filters",
                ).horizontalPadding(30.w),
                30.verticalH,
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        BrandsFilter(
                          brands: controller.brands,
                          selectedBrand: controller.selectedBrand,
                          onTap: controller.setBrand,
                        ),
                        30.verticalH,
                        PriceRangeSliderFilter(
                          selectedRange: controller.selectedPriceRange,
                          onChange: controller.setPriceRange,
                        ),
                        30.verticalH,
                        SortByFilter(
                          chipValues: controller.sortByList,
                          selectedValue: controller.selectedSortBy,
                          onChange: controller.setSortBy,
                        ),
                        30.verticalH,
                        GenderFilter(
                          chipValues: controller.genders,
                          selectedValue: controller.selectedGender,
                          onChange: controller.setGender,
                        ),
                        30.verticalH,
                        ColorFilter(
                          colors: controller.colors,
                          selectedValue: controller.selectedColor,
                          onChange: controller.setColor,
                        ),
                        30.verticalH
                      ],
                    ),
                  ),
                ),
                FilterButtons(
                  resetText: "RESET (4)",
                  onApply: controller.onApply,
                  onResset: () {},
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class FilterButtons extends StatelessWidget {
  const FilterButtons({
    super.key,
    required this.onResset,
    required this.onApply,
    required this.resetText,
    this.applyText = "APPLY",
  });

  final VoidCallback onResset;
  final VoidCallback onApply;
  final String resetText;
  final String applyText;

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
            title: applyText,
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

class ColorFilter extends StatelessWidget {
  const ColorFilter({
    super.key,
    required this.colors,
    this.selectedValue,
    required this.onChange,
  });
  final List<CustomColor> colors;
  final CustomColor? selectedValue;
  final Function(CustomColor) onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Colors",
          style: context.lable16600,
        ).horizontalPadding(30.w),
        20.verticalH,
        SizedBox(
          width: context.width,
          height: 40.h,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: colors.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return SizedBox(width: 30.w);
              } else {
                final value = colors[index - 1];
                return _buildColorWidget(
                  context,
                  color: value,
                  onChange: onChange,
                  selectedValue: selectedValue,
                ).endPadding(10.w);
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildColorWidget(
    BuildContext context, {
    required CustomColor color,
    CustomColor? selectedValue,
    required Function(CustomColor) onChange,
  }) {
    return GestureDetector(
      onTap: () => onChange.call(color),
      child: Container(
        height: 40.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            width: 1.r,
            color: selectedValue == color
                ? AppColors.black
                : AppColors.graySecondary,
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 20.w,
              width: 20.w,
              decoration: BoxDecoration(
                color: color.color,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1.r,
                  color: AppColors.graySecondary,
                ),
              ),
            ),
            10.horizontalW,
            Text(
              color.name,
              style: context.lable16600,
            ),
          ],
        ),
      ),
    );
  }
}

class GenderFilter extends StatelessWidget {
  const GenderFilter({
    super.key,
    this.selectedValue,
    required this.onChange,
    required this.chipValues,
  });

  final List<String> chipValues;
  final String? selectedValue;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: context.lable16600,
        ).horizontalPadding(30.w),
        20.verticalH,
        SizedBox(
          width: context.width,
          height: 40.h,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: chipValues.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return SizedBox(width: 30.w);
              } else {
                final value = chipValues[index - 1];
                return CustomChipWidget(
                  selectedValue: selectedValue,
                  onChange: onChange,
                  value: value,
                ).endPadding(10.w);
              }
            },
          ),
        ),
      ],
    );
  }
}

class SortByFilter extends StatelessWidget {
  const SortByFilter({
    super.key,
    this.selectedValue,
    required this.onChange,
    required this.chipValues,
  });

  final List<String> chipValues;
  final String? selectedValue;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sort By",
          style: context.lable16600,
        ).horizontalPadding(30.w),
        20.verticalH,
        SizedBox(
          width: context.width,
          height: 40.h,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: chipValues.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return SizedBox(width: 30.w);
              } else {
                final value = chipValues[index - 1];
                return CustomChipWidget(
                  selectedValue: selectedValue,
                  onChange: onChange,
                  value: value,
                ).endPadding(10.w);
              }
            },
          ),
        )
      ],
    );
  }
}

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

class PriceRangeSliderFilter extends StatelessWidget {
  const PriceRangeSliderFilter({
    super.key,
    required this.selectedRange,
    required this.onChange,
    this.min = 0,
    this.max = 1700,
  });
  final RangeValues selectedRange;
  final Function(RangeValues) onChange;
  final double min, max;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Price Range",
          style: context.lable16600,
        ).horizontalPadding(30.w),
        20.verticalH,
        SliderTheme(
          data: const SliderThemeData(
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 35)),
          child: RangeSlider(
            min: 0,
            max: 1700,
            values: selectedRange,
            onChanged: onChange,
            activeColor: AppColors.lightBlack,
            inactiveColor: AppColors.lightBlack.withOpacity(.15),
          ).horizontalPadding(10.w),
        ),
        4.verticalH,
        Row(
          children: [
            Text(
              "\$$min",
              style: context.lable11700.copyWith(
                color: AppColors.lightBlack.withOpacity(.5),
              ),
            ),
            32.horizontalW,
            Text(
              "\$ ${selectedRange.start.toStringAsFixed(1)}",
              style: context.lable12400.copyWith(fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            Text(
              "\$ ${selectedRange.end.toStringAsFixed(1)}",
              style: context.lable12400.copyWith(fontWeight: FontWeight.w700),
            ),
            32.horizontalW,
            Text(
              "\$$max",
              style: context.lable11700.copyWith(
                color: AppColors.lightBlack.withOpacity(.5),
              ),
            ),
          ],
        ).horizontalPadding(30.w),
      ],
    );
  }
}

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
          "Brands",
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
