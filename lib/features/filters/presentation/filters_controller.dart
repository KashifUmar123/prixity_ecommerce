import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prixity_ecommerce_app/core/constants/app_contants.dart';
import 'package:prixity_ecommerce_app/core/constants/images_constants.dart';
import 'package:prixity_ecommerce_app/core/controllers/base_controller.dart';
import 'package:prixity_ecommerce_app/core/routes/navigator.dart';
import 'package:prixity_ecommerce_app/features/discover/data/models/filter_params.dart';
import 'package:prixity_ecommerce_app/features/filters/domain/entities/brand.dart';

class CustomColor {
  final String name;
  final Color color;

  CustomColor({
    required this.name,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'color': color.value,
    };
  }

  factory CustomColor.fromMap(Map<String, dynamic> map) {
    return CustomColor(
      name: map['name'] as String,
      color: Color(map['color'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomColor.fromJson(String source) =>
      CustomColor.fromMap(json.decode(source) as Map<String, dynamic>);
}

class FiltersController extends BaseController {
  FiltersController({required super.navigator});
  final RangeValues defaultRangeValues = AppConstants.defaultRangeValues;

  // ************* Brand setup
  final List<Brand> brands = [
    Brand(name: "NIKE", iconPath: KImages.nike),
    Brand(name: "Puma", iconPath: KImages.puma),
    Brand(name: "Adidas", iconPath: KImages.adidas),
    Brand(name: "Reebok", iconPath: KImages.reebok),
  ];

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    selectedPriceRange = defaultRangeValues;
    if (args != null && args is FilterParams) {
      selectedBrand = args.brand;
      selectedPriceRange = args.rangeValues ?? defaultRangeValues;
      selectedSortBy = args.sortBy;
      selectedGender = args.gender;
      selectedColor = args.color;
    }
  }

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
  late RangeValues selectedPriceRange;

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

  final List<String> genders = ["Male", "Female", "Unisex"];

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

  // ********************** onApply
  void onApply() {
    FilterParams params = FilterParams();
    // check the brand
    if (selectedBrand != null) {
      params.brand = selectedBrand;
    }

    // check range
    params.rangeValues = selectedPriceRange;

    // check sort by
    if (selectedSortBy != null) {
      params.sortBy = selectedSortBy;
    }

    // check gender
    if (selectedGender != null) {
      params.gender = selectedGender;
    }

    // check color
    if (selectedColor != null) {
      params.color = selectedColor;
    }

    Get.find<INavigator>().pop(result: params);
  }

  int get getTotalFilter {
    int total = 1;
    if (selectedBrand != null) {
      total++;
    }
    if (selectedSortBy != null) {
      total++;
    }
    if (selectedGender != null) {
      total++;
    }
    if (selectedColor != null) {
      total++;
    }
    return total;
  }

  void resetFilters() {
    selectedPriceRange = defaultRangeValues;
    selectedBrand = null;
    selectedSortBy = null;
    selectedGender = null;
    selectedColor = null;
    update();
  }
}
