enum Flavor {
  prod,
  stg,
  dev,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.prod:
        return 'Prixity Soft Ecommerce';
      case Flavor.stg:
        return 'Ecommerce Dev';
      case Flavor.dev:
        return 'Ecommerce Dev';
      default:
        return 'title';
    }
  }

}
