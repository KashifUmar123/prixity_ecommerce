import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/constants/app_locales.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/padding_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/theme_extension.dart';
import 'package:prixity_ecommerce_app/core/utils/utils.dart';
import 'package:prixity_ecommerce_app/core/widgets/cart_icon.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_appbar.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_button.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_container_with_title_and_button.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_image.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_rating_display.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_review_widget.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_scaffold.dart';
import 'package:prixity_ecommerce_app/core/dummy_data/dummy_data.dart';
import 'package:prixity_ecommerce_app/features/product_detail/presentation/product_detail_controller.dart';

class ProductDetailScreen extends GetView<ProductDetailController> {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      systemNavigationBarColor: AppColors.white,
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
                  actions: [
                    CartIcon(),
                  ],
                ).horizontalPadding(30.w),
                25.verticalH,
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      _imagePageViewBuilder(context),
                      30.verticalH,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.product.name,
                            style: context.lable20700,
                          ),
                          10.verticalH,
                          _ratingsAndCount(context),
                          30.verticalH,
                          Text(
                            AppLocales.size.tr,
                            style: context.lable16600,
                          ),
                          10.verticalH,
                          _sizeList(context),
                          30.verticalH,
                          Text(
                            AppLocales.description.tr,
                            style: context.lable16600,
                          ),
                          10.verticalH,
                          Text(
                            controller.product.description,
                            style: context.lable14400,
                          ),
                          30.verticalH,
                          Text(
                            "${AppLocales.review.tr} (${controller.product.totalReviews})",
                            style: context.lable16600,
                          ),
                          10.verticalH,
                          ...sampleReviews.take(3).map(
                                (e) => CustomReviewWidget(review: e)
                                    .bottomPadding(30.w),
                              ),
                          CustomButton(
                            title: AppLocales.seeAllReviews.tr,
                            onTap: controller.onSeeAllReviews,
                          ),
                          30.verticalH,
                        ],
                      ).horizontalPadding(30.w),
                    ],
                  ),
                ),
                GetBuilder(
                    init: controller.cartController,
                    builder: (context) {
                      return CustomContainerWithTitleAndButton(
                        title: AppLocales.price.tr,
                        amount: "\$${controller.product.price}",
                        btnText: AppLocales.addToCart.tr,
                        isDisable: controller.productAlreadyAddedInCart(),
                        btnCallback: () => controller.onAddToCart(
                          controller.product,
                        ),
                      );
                    }),
              ],
            );
          },
        ),
      ),
    );
  }

  _sizeList(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: double.infinity,
      child: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        children: [
          ...controller.product.sizes.map(
            (e) => GestureDetector(
              onTap: () => controller.setSize(e),
              child: Container(
                height: 40.h,
                width: 40.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: controller.selectedSize == e
                      ? AppColors.black
                      : Colors.transparent,
                  border: Border.all(
                    width: 1.r,
                    color: AppColors.graySecondary,
                  ),
                ),
                child: Center(
                  child: Text(
                    e.toString(),
                    style: context.lable14700.copyWith(
                      color: controller.selectedSize == e
                          ? AppColors.white
                          : AppColors.black,
                    ),
                  ),
                ),
              ).endPadding(15.w),
            ),
          )
        ],
      ),
    );
  }

  _ratingsAndCount(BuildContext context) {
    return Row(
      children: [
        const CustomRatingDisplay(
          totalFilledStart: 3,
        ),
        5.horizontalW,
        Text("4.5", style: context.lable11700),
        5.horizontalW,
        Text(
          "(${controller.product.totalReviews} Reviews)",
          style: context.lable11400.copyWith(color: AppColors.gray),
        ),
      ],
    );
  }

  _imagePageViewBuilder(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 315.w,
        width: 315.w,
        child: Stack(
          children: [
            Positioned.fill(
              child: _getBuilderImages(context),
            ),
            Positioned(
              bottom: 26.h,
              left: 0,
              right: 0,
              child: _getBuilderLowerContent(context),
            ),
          ],
        ),
      ),
    );
  }

  _getBuilderLowerContent(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 20.w, end: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          _getBuildDotTrack(context),
          _buildColorsContainer(context),
        ],
      ),
    );
  }

  _buildColorsContainer(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        start: 10.w,
        top: 10.w,
        bottom: 10.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 15.r,
            color: AppColors.gray,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...controller.product.colors.map(
            (e) => GestureDetector(
              onTap: () => controller.setColor(e),
              child: Container(
                height: 20.w,
                width: 20.w,
                margin: EdgeInsetsDirectional.only(end: 10.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: e.color,
                  border: Border.all(
                    color: AppColors.graySecondary,
                    width: 1.r,
                  ),
                ),
                child: controller.seletedColor == e
                    ? Center(
                        child: Icon(
                          Icons.check,
                          color: Utils.isColorLighterThanGray(e.color)
                              ? AppColors.black
                              : AppColors.white,
                          size: 10.r,
                        ),
                      )
                    : null,
              ),
            ),
          )
        ],
      ),
    );
  }

  _getBuildDotTrack(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...controller.product.images.mapIndexed(
          (index, element) => Container(
            width: 7.w,
            height: 7.w,
            margin: EdgeInsetsDirectional.only(end: 10.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: controller.pageIndex == index
                  ? AppColors.black
                  : AppColors.gray,
            ),
          ),
        ),
      ],
    );
  }

  _getBuilderImages(BuildContext context) {
    return SizedBox(
      height: 315.w,
      width: 315.w,
      child: PageView.builder(
        itemCount: controller.product.images.length,
        onPageChanged: controller.setPageIndex,
        itemBuilder: (context, index) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.lightBlack.withOpacity(.05),
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Center(
              child: CustomImage(
                imagePath: controller.product.images.first,
                height: 250.w,
                width: 250.w,
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
    );
  }
}
