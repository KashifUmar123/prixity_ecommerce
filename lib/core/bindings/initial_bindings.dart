import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/localisation/translations.dart';
import 'package:prixity_ecommerce_app/features/cart/presentation/cart_controller.dart';
import 'package:prixity_ecommerce_app/core/routes/navigator.dart';

class InitalBindings {
  static Future<void> initialize() async {
    // firebase initialization
    await Firebase.initializeApp();

    // load translations
    await AppTranslations.loadTranslations();

    // upload dummy data to firestore
    // await uploadDummyData();

    // uncomment for uploading an image to firebase storage
    // await uploadImagesFromAssets(
    //   [
    //     "assets/shoes/shoe_1.png",
    //     "assets/shoes/shoe_2.png",
    //     "assets/shoes/shoe_3.png",
    //     "assets/shoes/shoe_4.png",
    //     "assets/shoes/shoe_5.png",
    //     "assets/shoes/shoe_6.png",
    //     "assets/shoes/shoe_7.png",
    //   ],
    //   "shoe_image",
    // );

    // put navigator
    Get.lazyPut<INavigator>(() => NavigatorImpl());

    // put cart controller
    Get.put(
      CartController(navigator: Get.find<INavigator>()),
      permanent: true,
    );
  }
}
