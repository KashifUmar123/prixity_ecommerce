import 'package:dartz/dartz.dart';
import 'package:prixity_ecommerce_app/core/network/failures/failure.dart';
import 'package:prixity_ecommerce_app/features/discover/data/models/filter_params.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/model/product_entity.dart';

abstract class IDiscoverRepository {
  Future<Either<Failure, List<Product>>> getProducts(FilterParams params);
}
