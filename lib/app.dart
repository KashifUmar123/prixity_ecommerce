import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/routes/routes.dart';
import 'package:prixity_ecommerce_app/core/routes/routes_paths.dart';
import 'flavors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 872),
      child: GetMaterialApp(
        title: F.title,
        getPages: AppRoutes.pages,
        initialRoute: RoutePaths.splash,
      ),
    );
  }
}
