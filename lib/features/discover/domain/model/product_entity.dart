// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Product {
  String? id;
  String name;
  String brand;
  String description;
  List<num> sizes;
  List<String> images;
  List<Color> colors;
  num price;
  int createdAt;
  int updatedAt;
  String gender;
  List<Review> reviews;

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
    required this.reviews,
  });
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
