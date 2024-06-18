import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/padding_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/theme_extension.dart';
import 'package:prixity_ecommerce_app/core/widgets/cart_icon.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_appbar.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_review_widget.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_scaffold.dart';
import 'package:prixity_ecommerce_app/features/discover/data/dummy_data.dart';
import 'package:prixity_ecommerce_app/features/reviews/presentation/reviews_controller.dart';

class ReviewsScreen extends GetView<ReviewsController> {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      systemNavigationBarColor: AppColors.white.withOpacity(.96),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: GetBuilder(
            init: controller,
            builder: (_) {
              return Column(
                children: [
                  70.verticalH,
                  const CustomAppbar(
                    actions: [CartIcon()],
                    title: "Review (1045)",
                  ).horizontalPadding(30.w),
                  20.verticalH,
                  _listReviewsTabs(context),
                  30.verticalH,
                  Expanded(
                    child: ListView(
                      padding:
                          EdgeInsetsDirectional.symmetric(horizontal: 30.w),
                      children: [
                        ...sampleReviews.map(
                          (e) =>
                              CustomReviewWidget(review: e).bottomPadding(30.h),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }

  _listReviewsTabs(BuildContext context) {
    return SizedBox(
      height: 30.h,
      width: double.infinity,
      child: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        children: [
          30.horizontalW,
          ...["All", "5 Stars", "4 Stars", "3 Stars", "2 Stars", "1 Stars"].map(
            (e) => GestureDetector(
              onTap: () => controller.setTab(e),
              child: Text(
                e,
                style: context.lable20700.copyWith(
                  color: controller.selectedTab == e
                      ? AppColors.black
                      : AppColors.gray,
                ),
              ).endPadding(20.w),
            ),
          )
        ],
      ),
    );
  }
}
