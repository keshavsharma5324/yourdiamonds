import 'package:dartz/dartz.dart';
import 'package:yourdiamonds/core/error/failure.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';

abstract class DataSetRepository {
  
  Future<Either<Failure,List<DiamondEntity?>>> getDataSet();

}