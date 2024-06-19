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
import 'package:prixity_ecommerce_app/features/discover/data/dummy_data.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/model/product_entity.dart';
import 'package:prixity_ecommerce_app/features/discover/presentation/discover_controller.dart';

class DiscoverScreen extends GetView<DiscoverController> {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      statusBarColor: AppColors.white,
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: GetBuilder(
            init: controller,
            builder: (_) {
              return Column(
                children: [
                  50.verticalH,
                  _buildAppbar(context).horizontalPadding(30.w),
                  24.verticalH,
                  _listBrands(context),
                  30.verticalH,
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        _placeProducts(context),
                      ],
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }

  Widget _placeProducts(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      children: [
        ...products.map(
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
                    imagePath: KImages.nike,
                    height: 24.w,
                    width: 24.w,
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
                Text("4.5", style: context.lable11700),
                5.horizontalW,
                Text(
                  "(${product.reviews.length} Reviews)",
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
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        scrollDirection: Axis.horizontal,
        children: [
          30.horizontalW,
          ...controller.brands.map((brand) {
            return _brandListItem(
              context,
              value: brand,
              onTap: controller.setBrand,
              isSelected: brand == controller.selectedBrand,
            );
          }),
        ],
      ),
    );
  }

  Widget _brandListItem(
    BuildContext context, {
    required String value,
    required Function(String) onTap,
    bool isSelected = false,
  }) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 20.w),
      child: GestureDetector(
        onTap: () => onTap.call(value),
        child: Text(
          value,
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
