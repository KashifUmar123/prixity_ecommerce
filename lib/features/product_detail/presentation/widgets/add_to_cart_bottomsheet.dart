import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';
import 'package:prixity_ecommerce_app/features/cart/presentation/cart_controller.dart';
import 'package:prixity_ecommerce_app/core/extensions/height_and_width_extension.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';
import 'package:prixity_ecommerce_app/core/routes/navigator.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_button.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/model/product_entity.dart';

class AddToCartBottomSheet extends StatefulWidget {
  const AddToCartBottomSheet({
    super.key,
    required this.product,
    required this.params,
    required this.navigator,
    required this.cartController,
  });

  final Product product;
  final ProductParams params;
  final INavigator navigator;
  final CartController cartController;

  @override
  State<AddToCartBottomSheet> createState() => _AddToCartBottomSheetState();
}

class _AddToCartBottomSheetState extends State<AddToCartBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Quantity",
              style: context.lable20700,
            ),
            IconButton(
              icon: const Icon(
                Icons.close,
                color: AppColors.lightBlack,
              ),
              onPressed: widget.navigator.pop,
            )
          ],
        ),
        30.verticalH,
        Text("Quantity", style: context.lable14700),
        10.verticalH,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.params.quantity.toString(), style: context.lable14400),
            const Spacer(),
            _buildButton(
              context,
              callback: () {
                setState(() {
                  widget.params.quantity--;
                });
              },
              isUnclickable: widget.params.quantity == 1,
              icon: Icons.remove,
            ),
            20.horizontalW,
            _buildButton(
              context,
              callback: () {
                setState(() {
                  widget.params.quantity++;
                });
              },
              icon: Icons.add,
            ),
          ],
        ),
        20.verticalH,
        Divider(
          thickness: 1.r,
          color: AppColors.lightBlack,
        ),
        30.verticalH,
        Row(
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
                  "\$$totalPrice",
                  style: context.lable20700,
                )
              ],
            ),
            CustomButton(
              title: "ADD TO CART",
              backgroundColor: AppColors.black,
              titleColor: AppColors.white,
              width: 156.w,
              onTap: () {
                widget.cartController.addProduct(
                  CartProduct(
                    params: widget.params,
                    product: widget.product,
                  ),
                );
              },
            )
          ],
        ),
      ],
    );
  }

  num get totalPrice => widget.params.quantity * widget.product.price;

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
