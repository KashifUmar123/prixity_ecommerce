import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_container_with_title_and_button.dart';
import 'package:prixity_ecommerce_app/features/cart/cart_controller.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/padding_extension.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_appbar.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_scaffold.dart';
import 'package:prixity_ecommerce_app/features/order_summary/presentation/order_summary_controller.dart';
import 'package:prixity_ecommerce_app/features/order_summary/presentation/widgets/order_details_block_widget.dart';
import 'package:prixity_ecommerce_app/features/order_summary/presentation/widgets/order_information_block_widget.dart';
import 'package:prixity_ecommerce_app/features/order_summary/presentation/widgets/order_payment_details_widget.dart';

class OrderSummaryScreen extends GetView<OrderSummaryController> {
  const OrderSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            70.verticalH,
            const CustomAppbar(
              title: "Order Summary",
            ).horizontalPadding(30.w),
            30.verticalH,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const OrderInformationBlock(),
                    30.verticalH,
                    OrderDetailsBlock(
                      cartController: Get.find<CartController>(),
                    ),
                    30.verticalH,
                    OrderPaymentDetailsBlock(
                      cartController: Get.find<CartController>(),
                    ),
                  ],
                ),
              ),
            ),
            CustomContainerWithTitleAndButton(
              title: "Grand total",
              amount:
                  "\$${controller.cartController.totalPrice + controller.cartController.shippingCost}",
              btnText: "PAY",
              btnCallback: controller.onPay,
            ),
          ],
        ),
      ),
    );
  }
}
