import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';
import 'package:prixity_ecommerce_app/core/routes/navigator.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    this.title,
    this.actions,
  });

  final String? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: Get.find<INavigator>().pop,
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        const Spacer(),
        if (title != null)
          Text(
            title ?? "",
            style: context.lable16600,
          ),
        const Spacer(),
        ...?actions,
      ],
    );
  }
}
