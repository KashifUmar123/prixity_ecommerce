class ProductParams {
  int quantity;
  String color;
  num size;

  ProductParams({
    this.quantity = 1,
    required this.color,
    required this.size,
  });
}
