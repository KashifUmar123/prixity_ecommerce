import 'package:dartz/dartz.dart';
import 'package:prixity_ecommerce_app/core/network/failures/failure.dart';
import 'package:prixity_ecommerce_app/core/usecase/usecase.dart';
import 'package:prixity_ecommerce_app/features/discover/data/models/filter_params.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/model/product_entity.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/repository/discover_repository.dart';

class GetProductsUsecase extends UseCase<List<Product>, FilterParams> {
  final IDiscoverRepository _repository;

  GetProductsUsecase({
    required IDiscoverRepository discoverRepository,
  }) : _repository = discoverRepository;

  @override
  Future<Either<Failure, List<Product>>> call(params) async {
    return _repository.getProducts(params);
  }
}
