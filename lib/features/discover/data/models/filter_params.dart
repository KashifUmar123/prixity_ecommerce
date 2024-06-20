import 'package:flutter/material.dart';
import 'package:prixity_ecommerce_app/features/filters/domain/entities/brand.dart';
import 'package:prixity_ecommerce_app/features/filters/presentation/filters_controller.dart';

class FilterParams {
  String? lastProductId;
  Brand? brand;
  RangeValues? rangeValues;
  String? sortBy;
  String? gender;
  CustomColor? color;

  @override
  String toString() {
    return "Brand: ${brand?.toMap()}, Range: $rangeValues, SortBy: $sortBy, Gender: $gender, Color: ${color?.toMap()}, lastProductId: $lastProductId";
  }

  bool get hasNonRangeValues {
    return brand != null || sortBy != null || gender != null || color != null;
  }
}
