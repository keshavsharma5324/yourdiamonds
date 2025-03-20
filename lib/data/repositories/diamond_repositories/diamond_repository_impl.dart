import 'package:dartz/dartz.dart';
import 'package:yourdiamonds/core/error/exception.dart';
import 'package:yourdiamonds/core/error/failure.dart';
import 'package:yourdiamonds/data/data_sources/local_data_source.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';
import 'package:yourdiamonds/domain/repositories/diamond_repository.dart';

class DiamondRepositoryImpl extends DiamondRepository {
  final DataSetLocalDataSource dataSetLocalDataSource;

  DiamondRepositoryImpl({required this.dataSetLocalDataSource});

  @override
  Future<Either<Failure, DiamondEntity>> getDiamond(DiamondEntity? diamond) async{
    try {
      return Right(diamond ?? DiamondEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    }
  }
}