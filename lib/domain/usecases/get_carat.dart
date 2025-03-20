import 'package:dartz/dartz.dart';
import 'package:yourdiamonds/core/error/failure.dart';
import 'package:yourdiamonds/domain/entities/cart.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';
import 'package:yourdiamonds/domain/repositories/cart_repository.dart';

class GetCaratUseCase {

  final CartRepository caratRepository;

  GetCaratUseCase(this.caratRepository);

  Future<Either<Failure, CartEntity>> executeSave(List<DiamondEntity?> entity) {
    return caratRepository.saveCartResults(entity);
  }

  Future<Either<Failure, CartEntity>> getSavedResults() {
    return caratRepository.getCartResults();
  }
}