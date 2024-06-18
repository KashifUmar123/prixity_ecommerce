import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/extensions/textstyle_extension.dart';
import 'package:prixity_ecommerce_app/core/widgets/custom_scaffold.dart';
import 'package:prixity_ecommerce_app/features/splash/presentation/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Prixity Soft \nAssement Project",
                style: context.lable30700,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
