import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:yourdiamonds/core/error/failure.dart';
import 'package:yourdiamonds/data/data_sources/local_data_source.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';
import 'package:yourdiamonds/domain/repositories/dataset_repository.dart';
import '../../../core/error/exception.dart';

class DataSetRepositoryImpl extends DataSetRepository {
  final DataSetLocalDataSource dataSetLocalDataSource;
  DataSetRepositoryImpl({required this.dataSetLocalDataSource});

  @override
  Future<Either<Failure, List<DiamondEntity?>>> getDataSet() async {
    try {
      final result = await dataSetLocalDataSource.getDataSet();
      return Right(result?.diamonds
              ?.map((e) => e?.toEntity() ?? DiamondEntity())
              .toList() ??
          []);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
