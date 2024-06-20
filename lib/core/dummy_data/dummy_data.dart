import 'dart:math';
import 'package:flutter/material.dart';
import 'package:prixity_ecommerce_app/core/constants/images_constants.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/model/product_entity.dart';
import 'package:prixity_ecommerce_app/features/filters/domain/entities/brand.dart';
import 'package:prixity_ecommerce_app/features/filters/presentation/filters_controller.dart';

List<Review> sampleReviews = List.generate(
  10,
  (index) => Review(
    id: 'review_$index',
    name: 'Reviewer $index',
    imageUrl: 'assets/images/${index % 2 == 0 ? "profile_1" : "profile_2"}.png',
    eview: 'This is review $index',
    ratings: (index % 5) + 1,
    createdAt: DateTime.now().millisecondsSinceEpoch,
    updatedAt: DateTime.now().millisecondsSinceEpoch,
  ),
);

// List<Product> products = List.generate(
//   100,
//   (index) => Product(
//     id: 'product_$index',
//     name: 'Product $index',
//     brand: getBrand(),
//     description: Faker().lorem.sentences(5).join(" "),
//     sizes: [8, 9, 10, 11, 12, 13, 14, 15],
//     images: getRandomImagePaths(),
//     colors: getColors(),
//     price: (index + 1) * 10.0,
//     createdAt: DateTime.now().millisecondsSinceEpoch,
//     updatedAt: DateTime.now().millisecondsSinceEpoch,
//     gender: getGender(),
//     stars: num.parse(getRandomDouble()),
//     totalReviews: getRandomTotalReviews(),
//   ),
// );

int getRandomTotalReviews() {
  final random = Random();
  return 23 + random.nextInt(278);
}

String getRandomDouble() {
  final random = Random();
  double value = 1 + random.nextDouble() * 4;

  double roundedValue = (value * 10).round() / 10;

  if (roundedValue == roundedValue.toInt().toDouble()) {
    return roundedValue.toInt().toString();
  } else {
    return roundedValue.toString();
  }
}

Brand getBrand() {
  final List<Brand> brands = [
    Brand(name: "NIKE", iconPath: KImages.nike),
    Brand(name: "Puma", iconPath: KImages.puma),
    Brand(name: "Adidas", iconPath: KImages.adidas),
    Brand(name: "Reebok", iconPath: KImages.reebok),
  ];
  brands.shuffle();
  return brands.take(1).toList()[0];
}

String getGender() {
  final list = ["Male", "Female", "Unisex"];
  list.shuffle();
  return list.take(1).toList()[0];
}

List<String> getRandomImagePaths() {
  return [
    "assets/shoes/shoe_7.png",
    "assets/shoes/shoe_7.png",
    "assets/shoes/shoe_7.png",
  ];
}

List<CustomColor> getColors() {
  final list = [
    CustomColor(
      name: "White",
      color: Colors.white,
    ),
    CustomColor(
      name: "Red",
      color: Colors.red,
    ),
    CustomColor(
      name: "Black",
      color: Colors.black,
    ),
    CustomColor(
      name: "Green",
      color: Colors.green,
    ),
    CustomColor(
      name: "Orange",
      color: Colors.orange,
    ),
    CustomColor(
      name: "Blue",
      color: Colors.blue,
    ),
    CustomColor(
      name: "Yellow",
      color: Colors.yellow,
    ),
  ];

  list.shuffle();

  return list.take(3).toList();
}

// Future<void> uploadDummyData() async {
//   try {
//     final CollectionReference productsCollection =
//         FirebaseFirestore.instance.collection("products");
//     WriteBatch batch = FirebaseFirestore.instance.batch();
//     for (var d in products) {
//       DocumentReference doc = productsCollection.doc();
//       batch.set(doc, d.toMap());
//     }
//     batch.commit();
//   } catch (e) {
//     print("Something went wrong");
//   }
// }
