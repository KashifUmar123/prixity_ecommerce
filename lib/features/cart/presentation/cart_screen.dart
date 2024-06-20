import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_container_with_title_and_button.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_empty_state_widget.dart';
import 'package:prixity_ecommerce_app/features/cart/presentation/cart_controller.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/padding_extension.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_appbar.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_scaffold.dart';
import 'package:prixity_ecommerce_app/features/cart/presentation/widgets/cart_slideable_list_widget.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

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
                children: [
                  70.verticalH,
                  const CustomAppbar(
                    title: "Cart",
                  ).horizontalPadding(30.w),
                  30.verticalH,
                  Expanded(
                    child: _bodyView(context),
                  ),
                  CustomContainerWithTitleAndButton(
                    title: "Grand total",
                    amount: "\$${controller.totalPrice}",
                    btnText: "CHECK OUT",
                    isDisable: controller.products.isEmpty,
                    btnCallback: controller.onCheckout,
                  ),
                ],
              );
            }),
      ),
    );
  }

  _bodyView(BuildContext context) {
    if (controller.products.isEmpty) {
      return const Center(
        child: CustomEmptyStateWidget(
          message: "Cart is empty",
        ),
      );
    }

    return CartSlideableWidget(
      products: controller.products,
      onRemoveProduct: controller.removeProduct,
      onDecrement: controller.decrementQuantity,
      onIncrement: controller.incrementQuantity,
    );
  }
}
