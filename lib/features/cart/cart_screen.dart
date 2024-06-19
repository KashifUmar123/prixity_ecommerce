import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/core/controllers/cart_controller.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/padding_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_appbar.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_image.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_scaffold.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/model/product_entity.dart';
import 'package:prixity_ecommerce_app/features/order_summary/presentation/order_summary_screen.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
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
                    child: _slideableList(context),
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

  _slideableList(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ...controller.products.map(
          (cartProduct) => Slidable(
            key: ValueKey(cartProduct.product.id),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) {
                    controller.removeProduct(cartProduct);
                  },
                  autoClose: true,
                  backgroundColor: AppColors.redSecondaryColor,
                  foregroundColor: Colors.white,
                  icon: Icons.delete_forever_outlined,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    bottomLeft: Radius.circular(20.r),
                  ),
                ),
              ],
            ),
            child: _buildCartItem(context, cartProduct: cartProduct),
          ),
        )
      ],
    );
  }

  _buildCartItem(BuildContext context, {required CartProduct cartProduct}) {
    Product product = cartProduct.product;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 88.w,
          width: 88.w,
          decoration: BoxDecoration(
            color: AppColors.lightBlack.withOpacity(.05),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: CustomImage(
            imagePath: product.images.first,
            height: 88.w,
            width: 88.w,
            fit: BoxFit.contain,
          ),
        ),
        15.horizontalW,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: context.lable16600,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              5.verticalH,
              Text(
                "${product.brand} . ${cartProduct.params.color} . ${cartProduct.params.size}",
                style: context.lable12400,
              ),
              10.verticalH,
              Row(
                children: [
                  Text(
                    "\$${product.price * cartProduct.params.quantity}",
                    style: context.lable14700,
                  ),
                  const Spacer(),
                  _buildButton(
                    context,
                    callback: () {
                      controller.decrementQuantity(cartProduct);
                    },
                    isUnclickable: cartProduct.params.quantity == 1,
                    icon: Icons.remove,
                  ),
                  20.horizontalW,
                  _buildButton(
                    context,
                    callback: () {
                      controller.incrementQuantity(cartProduct);
                    },
                    icon: Icons.add,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ).horizontalPadding(30.w).bottomPadding(30.h);
  }

  _buildButton(
    BuildContext context, {
    bool isUnclickable = false,
    required VoidCallback callback,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: () {
        if (!isUnclickable) {
          callback.call();
        }
      },
      child: Container(
        height: 24.w,
        width: 24.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 1.r,
            color: isUnclickable ? AppColors.gray : AppColors.black,
          ),
        ),
        child: Center(
          child: Icon(
            icon,
            color: isUnclickable ? AppColors.gray : AppColors.black,
            size: 15.r,
          ),
        ),
      ),
    );
  }
}
