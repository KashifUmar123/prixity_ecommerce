import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/constants/images_constants.dart';
import 'package:prixity_ecommerce_app/core/controllers/cart_controller.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/padding_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_image.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_scaffold.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/model/product_entity.dart';
import 'package:prixity_ecommerce_app/features/discover/presentation/discover_controller.dart';
import 'package:prixity_ecommerce_app/features/filters/domain/entities/brand.dart';

class DiscoverScreen extends GetView<DiscoverController> {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      // systemNavigationBarColor: AppColors.gray.withOpacity(.15),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: GetBuilder(
            init: controller,
            builder: (_) {
              return Stack(
                children: [
                  Positioned.fill(
                    child: Column(
                      children: [
                        50.verticalH,
                        _buildAppbar(context).horizontalPadding(30.w),
                        24.verticalH,
                        _listBrands(context),
                        30.verticalH,
                        Expanded(
                          child: controller.isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.lightBlack,
                                  ),
                                )
                              : ListView(
                                  controller: controller.scrollController,
                                  padding: EdgeInsets.zero,
                                  children: [
                                    _placeProducts(context),
                                  ],
                                ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 30.h,
                    left: (context.width - 119.w) / 2,
                    child: _filtersButton(context),
                  ),
                ],
              );
            }),
      ),
    );
  }

  _filtersButton(BuildContext context) {
    return GestureDetector(
      onTap: controller.onFiltersTap,
      child: Container(
        height: 40.h,
        width: 119.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.lightBlack,
          boxShadow: const [
            BoxShadow(
              color: AppColors.gray,
              blurRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImage(
                imagePath: KImages.filters,
                height: 24.w,
                width: 24.w,
              ),
              12.horizontalW,
              Text(
                "Filters",
                style: context.lable14700.copyWith(
                  color: AppColors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _placeProducts(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      children: [
        ...controller.products.map(
          (e) => _productWidget(
            context,
            product: e,
            onTap: controller.onProductTap,
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 30.w);
  }

  Widget _productWidget(
    BuildContext context, {
    required Product product,
    required Function(Product) onTap,
  }) {
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

  Widget _listBrands(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 32.h,
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        scrollDirection: Axis.horizontal,
        children: [
          30.horizontalW,
          ...controller.brands.map(
            (brand) {
              return _brandListItem(
                context,
                value: brand,
                onTap: controller.setBrand,
                isSelected: brand == controller.selectedBrand,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _brandListItem(
    BuildContext context, {
    required Brand value,
    required Function(Brand) onTap,
    bool isSelected = false,
  }) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 20.w),
      child: GestureDetector(
        onTap: () => onTap.call(value),
        child: Text(
          value.name,
          style: context.lable20700.copyWith(
            color: isSelected ? AppColors.black : AppColors.gray,
          ),
        ),
      ),
    );
  }

  Widget _buildAppbar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Discover",
          style: context.lable30700,
        ),
        GetBuilder(
            init: Get.find<CartController>(),
            builder: (cartController) {
              return GestureDetector(
                onTap: controller.onCartTap,
                child: CustomImage(
                  imagePath: cartController.products.isEmpty
                      ? KImages.emptyCart
                      : KImages.cart,
                  height: 24.w,
                  width: 24.w,
                ),
              );
            }),
      ],
    );
  }
}
