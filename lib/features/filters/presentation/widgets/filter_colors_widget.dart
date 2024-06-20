import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/constants/app_locales.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/padding_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';
import 'package:prixity_ecommerce_app/features/filters/presentation/filters_controller.dart';

class ColorFilterWidget extends StatelessWidget {
  const ColorFilterWidget({
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
          AppLocales.colors.tr,
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
