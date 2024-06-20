import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/constants/app_locales.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/padding_extension.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_appbar.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_scaffold.dart';
import 'package:prixity_ecommerce_app/features/filters/presentation/filters_controller.dart';
import 'package:prixity_ecommerce_app/features/filters/presentation/widgets/filter_brand_widget.dart';
import 'package:prixity_ecommerce_app/features/filters/presentation/widgets/filter_buttons_widgetr.dart';
import 'package:prixity_ecommerce_app/features/filters/presentation/widgets/filter_colors_widget.dart';
import 'package:prixity_ecommerce_app/features/filters/presentation/widgets/filter_gender_widget.dart';
import 'package:prixity_ecommerce_app/features/filters/presentation/widgets/filter_price_range_widget.dart';
import 'package:prixity_ecommerce_app/features/filters/presentation/widgets/filter_sortby_widget.dart';

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
                        ColorFilterWidget(
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
                  resetText:
                      "${AppLocales.reset.tr} (${controller.getTotalFilter})",
                  onApply: controller.onApply,
                  onResset: controller.resetFilters,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
