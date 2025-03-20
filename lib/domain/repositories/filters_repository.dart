import 'package:dartz/dartz.dart';
import 'package:yourdiamonds/core/error/failure.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';
import 'package:yourdiamonds/domain/entities/filters.dart';

abstract class FiltersRepository {
  
  Future<Either<Failure,FiltersEntity?>> getFilters();
  Future<Either<Failure,FiltersEntity?>> updateFilters(FiltersEntity? filter);
  Future<Either<Failure,List<DiamondEntity?>>> getFilteredResult(FiltersEntity? filter);
}