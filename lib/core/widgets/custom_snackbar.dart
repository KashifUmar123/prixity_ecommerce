import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/constants/app_colors.dart';

class CustomSnackbars {
  static void errorSnackbar({String title = "Oops", required String message}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: AppColors.red,
      colorText: AppColors.white,
      snackPosition: SnackPosition.TOP,
    );
  }

  static void successSnackbar(
      {String title = "Oops", required String message}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
    );
  }
}
