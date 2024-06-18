import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    this.appBar,
    this.body,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.floatingActionButton,
    this.resizeToAvoidBottomInset,
    this.extendBodyBehindAppBar = false,
    this.extendBody = false,
    this.statusBarColor,
    this.systemNavigationBarColor,
    this.isStatusBarBrightnessDark = true,
    this.topSafearea = false,
  });

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final bool? resizeToAvoidBottomInset;
  final bool extendBodyBehindAppBar;
  final bool extendBody;
  final Color? statusBarColor;
  final Color? systemNavigationBarColor;
  final bool isStatusBarBrightnessDark;
  final bool topSafearea;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
        statusBarColor: statusBarColor ?? AppColors.white.withOpacity(.96),
        systemNavigationBarColor:
            systemNavigationBarColor ?? AppColors.white.withOpacity(.96),
      ),
      child: SafeArea(
        top: topSafearea,
        bottom: false,
        child: Scaffold(
          key: key,
          backgroundColor: backgroundColor ?? AppColors.white.withOpacity(.96),
          appBar: appBar,
          body: body,
          bottomNavigationBar: bottomNavigationBar,
          bottomSheet: bottomSheet,
          floatingActionButton: floatingActionButton,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          extendBody: extendBody,
        ),
      ),
    );
  }
}
