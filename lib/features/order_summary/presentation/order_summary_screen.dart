import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/controllers/cart_controller.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/padding_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_appbar.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_button.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_scaffold.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/model/product_entity.dart';
import 'package:prixity_ecommerce_app/features/order_summary/presentation/order_summary_controller.dart';

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
            Container(
              height: Platform.isIOS ? 110.h : 90.h,
              width: double.infinity,
              padding: EdgeInsetsDirectional.only(
                start: 30.w,
                end: 30.w,
                top: 17.h,
              ),
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Grand Total",
                        style: context.lable12400.copyWith(
                          color: AppColors.gray,
                        ),
                      ),
                      5.verticalH,
                      Text(
                        "\$${controller.cartController.totalPrice + controller.cartController.shippingCost}",
                        style: context.lable20700,
                      )
                    ],
                  ),
                  CustomButton(
                    title: "PAY",
                    backgroundColor: AppColors.black,
                    titleColor: AppColors.white,
                    width: 156.w,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderPaymentDetailsBlock extends StatelessWidget {
  const OrderPaymentDetailsBlock({super.key, required this.cartController});
  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Payment Detail",
          style: context.lable18700,
        ),
        20.verticalH,
        _buildRowContent(
          context,
          title: "Sub Total",
          amount: cartController.totalPrice,
        ),
        20.verticalH,
        _buildRowContent(
          context,
          title: "Shipping",
          amount: cartController.shippingCost,
        ),
        20.verticalH,
        _buildRowContent(
          context,
          title: "Total Order",
          amount: cartController.shippingCost + cartController.totalPrice,
        ),
      ],
    ).horizontalPadding(30.w);
  }

  Widget _buildRowContent(
    BuildContext context, {
    required String title,
    required num amount,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.lable14400.copyWith(
            color: AppColors.secondaryDargGray,
          ),
        ),
        Text(
          "\$$amount",
          style: context.lable16600,
        ),
      ],
    );
  }
}

class OrderDetailsBlock extends StatelessWidget {
  const OrderDetailsBlock({super.key, required this.cartController});
  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Order Detail",
          style: context.lable18700,
        ),
        ...cartController.products.map(
          (e) => _buildOrderItem(context, cartProduct: e),
        ),
      ],
    ).horizontalPadding(30.w);
  }

  _buildOrderItem(BuildContext context, {required CartProduct cartProduct}) {
    Product product = cartProduct.product;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cartProduct.product.name,
          style: context.lable16600,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        10.verticalH,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${product.brand} . ${cartProduct.params.color} . ${cartProduct.params.size} . Qty ${cartProduct.params.quantity}",
            ),
            Text(
              "\$${cartProduct.params.quantity * product.price}",
              style: context.lable14700,
            )
          ],
        ),
      ],
    ).topPadding(20.h);
  }
}

class OrderInformationBlock extends StatelessWidget {
  const OrderInformationBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Information",
          style: context.lable18700,
        ),
        20.verticalH,
        _informationReusableWidget(
          context,
          title: "Payment Method",
          subtitle: "Credit Card",
        ),
        40.verticalH,
        _informationReusableWidget(
          context,
          title: "Location",
          subtitle: "Semarang, Indonesia",
        ),
      ],
    ).horizontalPadding(30.w);
  }

  _informationReusableWidget(
    BuildContext context, {
    required String title,
    required String subtitle,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.lable14700,
            ),
            5.verticalH,
            Text(
              subtitle,
              style: context.lable14400,
            ),
          ],
        ),
        Transform.rotate(
          angle: pi,
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.gray,
            size: 16.r,
          ),
        )
      ],
    );
  }
}
