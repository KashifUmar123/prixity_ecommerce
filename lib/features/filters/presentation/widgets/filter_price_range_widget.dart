import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/constants/app_locales.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/padding_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';

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
          AppLocales.priceRange.tr,
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
