import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/padding_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_image.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/model/product_entity.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.product,
    required this.onTap,
  });
  final Product product;
  final Function(Product) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(product),
      child: SizedBox(
        width: 150.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150.h,
              width: 150.w,
              decoration: BoxDecoration(
                color: AppColors.lightBlack.withOpacity(.05),
                borderRadius: BorderRadius.circular(20.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImage(
                    imagePath: product.brand.iconPath,
                    height: 24.w,
                    width: 24.w,
                    color: AppColors.gray,
                  ),
                  5.verticalH,
                  CustomImage(
                    imagePath: product.images.first,
                    height: 85.h,
                    width: 120.w,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            10.verticalH,
            Text(
              product.name,
              style: context.lable12400,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            5.verticalH,
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.yellow,
                  size: 12.w,
                ),
                5.horizontalW,
                Text(product.stars.toString(), style: context.lable11700),
                5.horizontalW,
                Text(
                  "(${product.totalReviews} Reviews)",
                  style: context.lable11400.copyWith(
                    color: AppColors.gray,
                  ),
                ),
              ],
            ),
            Text("\$${product.price}", style: context.lable14700),
          ],
        ),
      ).bottomPadding(30.h),
    );
  }
}
