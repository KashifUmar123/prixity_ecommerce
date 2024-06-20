import 'dart:math';
import 'package:faker/faker.dart';
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

List<Product> products = List.generate(
  100,
  (index) => Product(
    id: 'product_$index',
    name: 'Product $index',
    brand: getBrand(),
    description: Faker().lorem.sentences(5).join(" "),
    sizes: [8, 9, 10, 11, 12, 13, 14, 15],
    images: getRandomImagePaths(),
    colors: getColors(),
    price: (index + 1) * 10.0,
    createdAt: DateTime.now().millisecondsSinceEpoch,
    updatedAt: DateTime.now().millisecondsSinceEpoch,
    gender: getGender(),
    stars: num.parse(getRandomDouble()),
    totalReviews: getRandomTotalReviews(),
  ),
);

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
  List<String> images = [
    "https://firebasestorage.googleapis.com/v0/b/prixity-soft-e-commerce-app.appspot.com/o/shoe_image-1718871352242.jpg?alt=media&token=7631f524-5f58-4d94-8cb6-a89b22420f23",
    "https://firebasestorage.googleapis.com/v0/b/prixity-soft-e-commerce-app.appspot.com/o/shoe_image-1718871356020.jpg?alt=media&token=f5ce5ba9-1b2a-4b3c-953e-1a12d36b7137",
    "https://firebasestorage.googleapis.com/v0/b/prixity-soft-e-commerce-app.appspot.com/o/shoe_image-1718871359412.jpg?alt=media&token=5e7a8838-c7e1-40c6-ba5f-809403f54303",
    "https://firebasestorage.googleapis.com/v0/b/prixity-soft-e-commerce-app.appspot.com/o/shoe_image-1718871362613.jpg?alt=media&token=a827d04e-763e-4c20-be27-80d1a80acc14",
    "https://firebasestorage.googleapis.com/v0/b/prixity-soft-e-commerce-app.appspot.com/o/shoe_image-1718871366178.jpg?alt=media&token=50a839ad-c469-4e1d-91b1-2c54a5ffad9f",
    "https://firebasestorage.googleapis.com/v0/b/prixity-soft-e-commerce-app.appspot.com/o/shoe_image-1718871369591.jpg?alt=media&token=7c993a8d-fffa-4f94-bc7e-67b19672ff13",
    "https://firebasestorage.googleapis.com/v0/b/prixity-soft-e-commerce-app.appspot.com/o/shoe_image-1718871372904.jpg?alt=media&token=4428c258-5c24-4000-b9d3-6906d23df71b",
  ];

  images.shuffle();
  return images.take(3).toList();
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

// Future<void> uploadImagesFromAssets(
//     List<String> assetPaths, String fileNamePrefix) async {
//   final storageRef = FirebaseStorage.instance.ref();
//   final sb = StringBuffer(); // To build the text file content

//   for (final assetPath in assetPaths) {
//     final fileName =
//         '$fileNamePrefix-${DateTime.now().millisecondsSinceEpoch}.jpg'; // Unique filenames
//     final imageRef = storageRef.child(fileName);

//     try {
//       final byteData = await rootBundle.load(assetPath);
//       final imageData = byteData.buffer
//           .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
//       final uploadTask = imageRef.putData(imageData);

//       uploadTask.snapshotEvents.listen((event) {
//         final progress = event.bytesTransferred / event.totalBytes;
//         print('Uploading $assetPath: ${progress.toStringAsFixed(2)}');
//       });

//       final downloadUrl = await (await uploadTask).ref.getDownloadURL();
//       sb.write(downloadUrl);
//       sb.write('\n\n'); // Add two line breaks after each URL
//       print('Uploaded $assetPath: $downloadUrl');
//     } catch (error) {
//       print('Error uploading $assetPath: $error');
//     }
//   }

//   final file = File('links.txt');
//   await file.writeAsString(sb.toString());
// }
