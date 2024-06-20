import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/padding_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';

class OrderInformationBlock extends StatelessWidget {
  const OrderInformationBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Information",
          style: context.lable18700,
        ),
        20.verticalH,
        _informationReusableWidget(
          context,
          title: "Payment Method",
          subtitle: "Credit Card",
        ),
        40.verticalH,
        _informationReusableWidget(
          context,
          title: "Location",
          subtitle: "Semarang, Indonesia",
        ),
      ],
    ).horizontalPadding(30.w);
  }

  _informationReusableWidget(
    BuildContext context, {
    required String title,
    required String subtitle,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.lable14700,
            ),
            5.verticalH,
            Text(
              subtitle,
              style: context.lable14400,
            ),
          ],
        ),
        Transform.rotate(
          angle: pi,
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.gray,
            size: 16.r,
          ),
        )
      ],
    );
  }
}
