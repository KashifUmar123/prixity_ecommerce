import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:prixity_ecommerce_app/core/network/failures/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
