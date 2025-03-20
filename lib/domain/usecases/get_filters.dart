import 'package:dartz/dartz.dart';
import 'package:yourdiamonds/core/error/failure.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';
import 'package:yourdiamonds/domain/entities/filters.dart';
import 'package:yourdiamonds/domain/repositories/filters_repository.dart';

class GetFiltersUseCase {

  final FiltersRepository filtersRepository;

  GetFiltersUseCase(this.filtersRepository);

  Future<Either<Failure,FiltersEntity?>> executeFilters() {
    return filtersRepository.getFilters();
  }
  Future<Either<Failure, List<DiamondEntity?>>> getFilteredResult(FiltersEntity entity) {
    return filtersRepository.getFilteredResult(entity);
  }

  Future<Either<Failure,FiltersEntity?>> updateFilters(FiltersEntity? filter){
    return filtersRepository.updateFilters(filter);
  }
}