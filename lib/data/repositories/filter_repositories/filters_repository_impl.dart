import 'package:dartz/dartz.dart';
import 'package:yourdiamonds/core/error/failure.dart';
import 'package:yourdiamonds/data/data_sources/local_data_source.dart';
import 'package:yourdiamonds/data/models/filters_model.dart';
import 'package:yourdiamonds/domain/entities/clarity.dart';
import 'package:yourdiamonds/domain/entities/filters.dart';
import 'package:yourdiamonds/domain/entities/lab.dart';
import 'package:yourdiamonds/domain/entities/shape.dart';
import 'package:yourdiamonds/domain/repositories/filters_repository.dart';

import '../../../core/error/exception.dart';
import '../../../domain/entities/diamond.dart';

class FiltersRepositoryImpl extends FiltersRepository {
  final DataSetLocalDataSource dataSetLocalDataSource;

  FiltersRepositoryImpl({required this.dataSetLocalDataSource});

  @override
  Future<Either<Failure, List<DiamondEntity?>>> getFilteredResult(
      FiltersEntity? filter) async {
    try {
      final result = await dataSetLocalDataSource.getDataSet();
      List<DiamondEntity>? diamonds = [];
      if (filter != null) {
        if (filter.type == 'Select Type' ||
            (filter.clarity?.first == Clarity.Any && filter.type == 'Clarity') ||
            (filter.shape?.first == Shape.Any && filter.type == 'Shape') ||
            (filter.lab?.first == Lab.Any && filter.type == 'Lab') ||
            (filter.color?.first == 'Any' && filter.type == 'Color')) {
          diamonds = result?.diamonds
              ?.map((e) => e?.toEntity() ?? DiamondEntity())
              .toList();
        } else if (filter.type == 'Carat') {
          diamonds = result?.diamonds
              ?.where(
                (e) {
                  if (filter.carat != null &&
                      filter.carat!.first != null &&
                      e != null &&
                      e.carat != null &&
                      filter.carat!.length == 2) {
                    return filter.carat!.first! < e.carat! &&
                        filter.carat!.last! > e.carat!;
                  } else {
                    return false;
                  }
                },
              )
              .map((e) => e?.toEntity() ?? DiamondEntity())
              .toList();
        } else if (filter.type == 'Lab') {
          diamonds = result?.diamonds?.where(
                  (e) => filter.lab?.any((lab) => lab == e?.lab) ?? false)
              .map((e) => e?.toEntity() ?? DiamondEntity())
              .toList();
        } else if (filter.type == 'Color') {
          diamonds = result?.diamonds?.where(
                  (e) => filter.color?.any((color) => color == e?.color) ?? false)
              .map((e) => e?.toEntity() ?? DiamondEntity())
              .toList();
        } else if (filter.type == 'Shape') {
          diamonds = result?.diamonds?.where(
                  (e) => filter.shape?.any((shape) => shape == e?.shape) ?? false)
              .map((e) => e?.toEntity() ?? DiamondEntity())
              .toList();
        } else if (filter.type == 'Clarity') {
          diamonds = result?.diamonds?.where(
                  (e) => filter.clarity?.any((clarity) => clarity == e?.clarity) ?? false)
              .map((e) => e?.toEntity() ?? DiamondEntity())
              .toList();
        }
      }
      return Right(diamonds ?? []);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, FiltersEntity?>> updateFilters(
      FiltersEntity? filter) async {
    try {
      /*final result = await dataSetLocalDataSource.getDataSet();
      List<double> carats = [0.0];
      List<Lab> lab = [Lab.Any];
      List<Shape> shape = [Shape.Any];
      List<String> color = ['Any'];
      List<Clarity> clarity = [Clarity.Any];
      result?.diamonds?.forEach((diamond) {
        if ((!carats.contains(diamond?.carat)) && diamond?.carat != null) {
          carats.add(diamond!.carat!);
          carats.sort();
        }
        if ((!lab.any((ele) => ele == diamond?.lab)) && diamond?.lab != null) {
          lab.add(diamond!.lab!);
        }
        if ((!shape.any((ele) => ele == diamond?.shape)) &&
            diamond?.shape != null) {
          shape.add(diamond!.shape!);
        }
        if ((!color.contains(diamond?.color)) && diamond?.color != null) {
          color.add(diamond!.color!);
        }
        if ((!clarity.any((ele) => ele == diamond?.clarity)) &&
            diamond?.clarity != null) {
          clarity.add(diamond!.clarity!);
        }
      });
      FiltersModel filter = FiltersModel(
          carat: carats,
          shape: shape,
          color: color,
          lab: lab,
          clarity: clarity);
      if(filter.)*/
      return Right(filter ?? const FiltersEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, FiltersEntity?>> getFilters() async {
    try {
      final result = await dataSetLocalDataSource.getDataSet();
      List<double> carats = [0.0];
      List<Lab> lab = [Lab.Any];
      List<Shape> shape = [Shape.Any];
      List<String> color = ['Any'];
      List<Clarity> clarity = [Clarity.Any];
      result?.diamonds?.forEach((diamond) {
        if ((!carats.contains(diamond?.carat)) && diamond?.carat != null) {
          carats.add(diamond!.carat!);
          carats.sort();
        }
        if ((!lab.any((ele) => ele == diamond?.lab)) && diamond?.lab != null) {
          lab.add(diamond!.lab!);
        }
        if ((!shape.any((ele) => ele == diamond?.shape)) &&
            diamond?.shape != null) {
          shape.add(diamond!.shape!);
        }
        if ((!color.contains(diamond?.color)) && diamond?.color != null) {
          color.add(diamond!.color!);
        }
        if ((!clarity.any((ele) => ele == diamond?.clarity)) &&
            diamond?.clarity != null) {
          clarity.add(diamond!.clarity!);
        }
      });
      return Right(FiltersModel(
              carat: carats,
              shape: shape,
              color: color,
              lab: lab,
              type: 'Select Type',
              clarity: clarity)
          .toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    }
  }
}
