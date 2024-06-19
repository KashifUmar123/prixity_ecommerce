// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:prixity_ecommerce_app/core/constants/images_constants.dart';
import 'package:prixity_ecommerce_app/core/controllers/base_controller.dart';
import 'package:prixity_ecommerce_app/features/filters/domain/entities/brand.dart';

class CustomColor {
  final String name;
  final Color color;

  CustomColor({
    required this.name,
    required this.color,
  });
}

class FiltersController extends BaseController {
  FiltersController({required super.navigator});

  // ************* Brand setup
  final List<Brand> brands = [
    Brand(name: "NIKE", iconPath: KImages.nike),
    Brand(name: "Puma", iconPath: KImages.puma),
    Brand(name: "Adidas", iconPath: KImages.adidas),
    Brand(name: "Reebok", iconPath: KImages.reebok),
  ];

  Brand? selectedBrand;

  setBrand(Brand value) {
    if (value == selectedBrand) {
      selectedBrand = null;
    } else {
      selectedBrand = value;
    }
    update();
  }
  // ********************** brand setup end

  // ********************** Price range
  RangeValues selectedPriceRange = const RangeValues(300, 1000);

  setPriceRange(RangeValues value) {
    selectedPriceRange = value;
    update();
  }

  // ********************** price range end

  // ********************** Sort By

  List<String> sortByList = [
    "Most recent",
    "Lowest price",
    "Highest price",
  ];

  String? selectedSortBy;

  setSortBy(String value) {
    if (selectedSortBy == value) {
      selectedSortBy = null;
    } else {
      selectedSortBy = value;
    }
    update();
  }

  // ********************** Sort By end

  // ********************** Gender

  final List<String> genders = ["Man", "Woman", "Unisex"];

  String? selectedGender;

  setGender(String value) {
    if (selectedGender == value) {
      selectedGender = null;
    } else {
      selectedGender = value;
    }
    update();
  }

  // ********************** gender end

  // ********************** Color

  final List<CustomColor> colors = [
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
  ];

  CustomColor? selectedColor;

  setColor(CustomColor value) {
    if (selectedColor == value) {
      selectedColor = null;
    } else {
      selectedColor = value;
    }
    update();
  }

  // ********************** Color end
}
