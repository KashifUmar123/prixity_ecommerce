import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/constants/app_locales.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/padding_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/theme_extension.dart';
import 'package:prixity_ecommerce_app/core/widgets/cart_icon.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_appbar.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_review_widget.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_scaffold.dart';
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
                  CustomAppbar(
                    actions: const [CartIcon()],
                    title:
                        "${AppLocales.reviews.tr} (${controller.reviews.length})",
                  ).horizontalPadding(30.w),
                  20.verticalH,
                  _listReviewsTabs(context),
                  30.verticalH,
                  Expanded(
                    child: ListView(
                      padding:
                          EdgeInsetsDirectional.symmetric(horizontal: 30.w),
                      children: [
                        ...controller.reviews.map(
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
          ...[0, 5, 4, 3, 2, 1].map(
            (e) => GestureDetector(
              onTap: () => controller.setTab(e),
              child: Text(
                e == 0 ? "All" : "$e Stars",
                style: context.lable20700.copyWith(
                  color: controller.selectedStar == e
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
