import 'package:dartz/dartz.dart';
import 'package:yourdiamonds/core/error/failure.dart';
import 'package:yourdiamonds/domain/entities/cart.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';

abstract class CartRepository {

  Future<Either<Failure,CartEntity>> saveCartResults(List<DiamondEntity?> filter);
  Future<Either<Failure,CartEntity>> getCartResults();
}