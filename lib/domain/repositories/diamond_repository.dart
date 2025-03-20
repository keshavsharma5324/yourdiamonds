
import 'package:dartz/dartz.dart';
import 'package:yourdiamonds/core/error/failure.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';

abstract class DiamondRepository {
  Future<Either<Failure,DiamondEntity>> getDiamond(DiamondEntity? diamond);
}