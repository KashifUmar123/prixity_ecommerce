import 'package:prixity_ecommerce_app/features/discover/data/models/filter_params.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/model/product_entity.dart';

abstract class IDiscoverDataSource {
  Future<List<Product>> getProducts(FilterParams params);
}
