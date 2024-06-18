import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/model/product_entity.dart';

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

List<Product> products = List.generate(
  10,
  (index) => Product(
    id: 'product_$index',
    name: 'Product $index',
    brand: ['All', 'Nike', 'Jordan', 'Adidas', 'Reebok'][index % 5],
    description: 'Description for Product $index',
    sizes: [7, 8, 9, 10, 11],
    images: getRandomImagePaths(),
    colors: getRandomColors(['#E7E7E7', '#101010', '#648B8B', '#2952CC']),
    price: (index + 1) * 10.0,
    createdAt: DateTime.now().millisecondsSinceEpoch,
    updatedAt: DateTime.now().millisecondsSinceEpoch,
    gender: index % 2 == 0 ? 'Male' : 'Female',
    reviews: sampleReviews,
  ),
);

List<String> getRandomImagePaths() {
  return [
    "assets/shoes/shoe_7.png",
    "assets/shoes/shoe_7.png",
    "assets/shoes/shoe_7.png",
  ];
  // List<String> imagePaths =
  //     List.generate(8, (index) => 'assets/shoes/shoe_${index + 1}.png');
  // Random random = Random();
  // List<String> selectedImages = [];

  // while (selectedImages.length < 3) {
  //   int randomIndex = random.nextInt(imagePaths.length);
  //   String imagePath = imagePaths[randomIndex];
  //   if (!selectedImages.contains(imagePath)) {
  //     selectedImages.add(imagePath);
  //   }
  // }

  // return selectedImages;
}

List<Color> getRandomColors(List<String> colorHexList) {
  Random random = Random();
  List<Color> selectedColors = [];

  while (selectedColors.length < 3) {
    int randomIndex = random.nextInt(colorHexList.length);
    Color color = Color(
        int.parse(colorHexList[randomIndex].substring(1), radix: 16) +
            0xFF000000);
    if (!selectedColors.contains(color)) {
      selectedColors.add(color);
    }
  }

  return selectedColors;
}
