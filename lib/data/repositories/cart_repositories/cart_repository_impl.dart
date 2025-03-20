import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:yourdiamonds/core/error/exception.dart';
import 'package:yourdiamonds/core/error/failure.dart';
import 'package:yourdiamonds/data/data_sources/local_data_source.dart';
import 'package:yourdiamonds/domain/entities/cart.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';
import 'package:yourdiamonds/domain/repositories/cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  final DataSetLocalDataSource dataSetLocalDataSource;
  CartRepositoryImpl({required this.dataSetLocalDataSource});

  @override
  Future<Either<Failure, CartEntity>> getCartResults() async {
    try {
      final result = await dataSetLocalDataSource.openBox('cart');
      return Right(await result.get('cartItems') ?? CartEntity() );
    } on ServerException {
    return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
    return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> saveCartResults(
      List<DiamondEntity?> entity) async {
    try {
      final result = await dataSetLocalDataSource.openBox('cart');
      await result.put('cartItems', CartEntity(diamonds: entity),);
      return Right(await result.get('cartItems'));
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
