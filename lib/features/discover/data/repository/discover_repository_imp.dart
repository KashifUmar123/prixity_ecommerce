import 'package:dartz/dartz.dart';
import 'package:prixity_ecommerce_app/core/network/failures/failure.dart';
import 'package:prixity_ecommerce_app/features/discover/data/data_source/discover_data_source.dart';
import 'package:prixity_ecommerce_app/features/discover/data/models/filter_params.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/model/product_entity.dart';
import 'package:prixity_ecommerce_app/features/discover/domain/repository/discover_repository.dart';

class DiscoverRepositoryImp implements IDiscoverRepository {
  final IDiscoverDataSource _dataSource;

  DiscoverRepositoryImp({required IDiscoverDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<Either<Failure, List<Product>>> getProducts(
    FilterParams params,
  ) async {
    try {
      final result = await _dataSource.getProducts(params);
      return Right(result);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      }
      return Left(GeneralFailure("Something wen't wrong"));
    }
  }
}
