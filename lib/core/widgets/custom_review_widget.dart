import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_image.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_rating_display.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/model/product_entity.dart';

class CustomReviewWidget extends StatelessWidget {
  const CustomReviewWidget({super.key, required this.review});
  final Review review;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.w),
          child: CustomImage(
            imagePath: review.imageUrl,
            height: 40.w,
            width: 40.w,
            fit: BoxFit.cover,
          ),
        ),
        15.horizontalW,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 259.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    review.name,
                    style: context.lable14700,
                  ),
                  Text(
                    "Today",
                    style: context.lable12400.copyWith(
                      color: AppColors.gray,
                    ),
                  ),
                ],
              ),
            ),
            5.verticalH,
            const CustomRatingDisplay(totalFilledStart: 3),
            10.verticalH,
            Text(
              review.eview,
              style: context.lable12400,
            )
          ],
        )
      ],
    );
  }
}
