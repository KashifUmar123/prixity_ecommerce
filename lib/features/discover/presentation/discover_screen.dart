import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/constants/images_constants.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_empty_state_widget.dart';
import 'package:prixity_ecommerce_app/features/cart/presentation/cart_controller.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/padding_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_error_widget.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_image.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_loading_widget.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_scaffold.dart';
import 'package:prixity_ecommerce_app/features/discover/presentation/discover_controller.dart';
import 'package:prixity_ecommerce_app/features/discover/presentation/widgets/discover_filters_button_widget.dart';
import 'package:prixity_ecommerce_app/features/discover/presentation/widgets/product_widget.dart';
import 'package:prixity_ecommerce_app/features/filters/domain/entities/brand.dart';

class DiscoverScreen extends GetView<DiscoverController> {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
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
                        if (controller.error == null) ...[
                          24.verticalH,
                          _listBrands(context),
                        ],
                        30.verticalH,
                        Expanded(
                          child: _bodyView(context),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 30.h,
                    left: (context.width - 119.w) / 2,
                    child: DiscoverFiltersButtonWidget(
                      filtersApplied: controller.hasFiltersApplied,
                      onFiltersTap: controller.onFiltersTap,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }

  _bodyView(BuildContext context) {
    if (controller.isLoading) {
      return const CustomLoadingWidget();
    } else if (controller.error != null) {
      return CustomErrorWidget(
        subtitle: controller.error ?? "",
        callback: controller.retry,
      );
    }
    if (controller.products.isEmpty) {
      return const Center(
          child: CustomEmptyStateWidget(message: "Products not found"));
    }
    return RefreshIndicator(
      onRefresh: controller.onRefresh,
      child: ListView(
        controller: controller.scrollController,
        padding: EdgeInsets.zero,
        children: [
          _placeProducts(context),
        ],
      ),
    );
  }

  Widget _placeProducts(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      children: [
        ...controller.products.map(
          (e) => ProductWidget(
            product: e,
            onTap: controller.onProductTap,
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 30.w);
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
