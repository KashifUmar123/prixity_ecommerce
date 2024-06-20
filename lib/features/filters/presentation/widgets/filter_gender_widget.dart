import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/constants/app_locales.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/padding_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_chip_widget.dart';

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
          AppLocales.gender.tr,
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
