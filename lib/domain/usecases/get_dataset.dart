import 'package:dartz/dartz.dart';
import 'package:yourdiamonds/core/error/failure.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';
import 'package:yourdiamonds/domain/repositories/dataset_repository.dart';

class GetDataSetUseCase {

  final DataSetRepository dataSetRepository;

  GetDataSetUseCase(this.dataSetRepository);
  
  Future<Either<Failure,List<DiamondEntity?>>> execute() {
    return dataSetRepository.getDataSet();
  }
}