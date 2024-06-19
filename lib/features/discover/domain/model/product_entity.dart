import 'package:prixity_ecommerce_app/features/filters/domain/entities/brand.dart';
import 'package:prixity_ecommerce_app/features/filters/presentation/filters_controller.dart';

class Product {
  String? id;
  String name;
  Brand brand;
  String description;
  List<num> sizes;
  List<String> images;
  List<CustomColor> colors;
  num price;
  int createdAt;
  int updatedAt;
  String gender;
  num stars;
  int totalReviews;

  Product({
    this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.sizes,
    required this.images,
    required this.colors,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.gender,
    required this.stars,
    required this.totalReviews,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'brand': brand.toMap(),
      'description': description,
      'sizes': sizes,
      'images': images,
      'colors': colors.map((x) => x.toMap()).toList(),
      'price': price,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'gender': gender,
      'stars': stars,
      'totalReviews': totalReviews,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] as String,
      brand: Brand.fromMap(map['brand'] as Map<String, dynamic>),
      description: map['description'] as String,
      sizes: List<num>.from(map['sizes'] ?? []),
      images: List<String>.from(map['images']),
      colors: List<CustomColor>.from(
        (map['colors']).map<CustomColor>(
          (x) => CustomColor.fromMap(x as Map<String, dynamic>),
        ),
      ),
      price: map['price'] as num,
      createdAt: map['createdAt'] as int,
      updatedAt: map['updatedAt'] as int,
      gender: map['gender'] as String,
      stars: map['stars'] as num,
      totalReviews: map['totalReviews'] as int,
    );
  }
}

class Review {
  String? id;
  String name;
  String imageUrl;
  String eview;
  num ratings;
  int createdAt;
  int updatedAt;

  Review({
    this.id,
    required this.name,
    required this.imageUrl,
    required this.eview,
    required this.ratings,
    required this.createdAt,
    required this.updatedAt,
  });
}
