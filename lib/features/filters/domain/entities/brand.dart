// ignore_for_file: public_member_api_docs, sort_constructors_first
class Brand {
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
}
