import 'package:dartz/dartz.dart';
import 'package:yourdiamonds/core/error/failure.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';
import 'package:yourdiamonds/domain/repositories/diamond_repository.dart';

class GetDiamondUseCase {

  final DiamondRepository diamondRepository;

  GetDiamondUseCase(this.diamondRepository);

  Future<Either<Failure,DiamondEntity>> execute(DiamondEntity? diamond) {
    return diamondRepository.getDiamond(diamond);
  }
}