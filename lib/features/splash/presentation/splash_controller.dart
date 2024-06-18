import 'dart:async';

import 'package:prixity_ecommerce_app/core/controllers/base_controller.dart';
import 'package:prixity_ecommerce_app/core/routes/routes_paths.dart';

class SplashController extends BaseController {
  SplashController({required super.navigator});

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 1), () {
      navigator.pushNamed(RoutePaths.discover);
    });
  }
}
