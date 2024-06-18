// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:prixity_ecommerce_app/core/routes/navigator.dart';

class BaseController extends GetxController {
  final INavigator navigator;
  BaseController({
    required this.navigator,
  });
}
