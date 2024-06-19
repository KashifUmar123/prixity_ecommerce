import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Brand extends Equatable {
  String? id;
  int? totalProducts;
  String name;
  String iconPath;

  Brand({
    this.id,
    this.totalProducts,
    required this.name,
    required this.iconPath,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'totalProducts': totalProducts,
      'name': name,
      'iconPath': iconPath,
    };
  }

  factory Brand.fromMap(Map<String, dynamic> map) {
    return Brand(
      id: map['id'] != null ? map['id'] as String : null,
      totalProducts:
          map['totalProducts'] != null ? map['totalProducts'] as int : null,
      name: map['name'] as String,
      iconPath: map['iconPath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Brand.fromJson(String source) =>
      Brand.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [name, iconPath, id, totalProducts];
}
