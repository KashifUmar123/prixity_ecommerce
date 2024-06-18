import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/extensions/padding_extension.dart';

class CustomRatingDisplay extends StatelessWidget {
  const CustomRatingDisplay({
    super.key,
    this.totalStars = 5,
    this.fillColor = AppColors.yellow,
    required this.totalFilledStart,
  });
  final int totalStars;
  final Color fillColor;
  final int totalFilledStart;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < totalStars; i++)
          Icon(
            Icons.star,
            color: _getColor(i),
            size: 12.r,
          ).endPadding(5.w)
      ],
    );
  }

  Color _getColor(int index) {
    if (index <= totalFilledStart - 1) {
      return fillColor;
    }
    return AppColors.grayTertiary;
  }
}
