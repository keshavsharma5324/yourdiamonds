import 'package:get_it/get_it.dart';
import 'package:yourdiamonds/data/repositories/cart_repositories/cart_repository_impl.dart';
import 'package:yourdiamonds/data/repositories/diamond_repositories/diamond_repository_impl.dart';
import 'package:yourdiamonds/data/repositories/filter_repositories/filters_repository_impl.dart';
import 'package:yourdiamonds/domain/repositories/cart_repository.dart';
import 'package:yourdiamonds/domain/repositories/diamond_repository.dart';
import 'package:yourdiamonds/domain/repositories/filters_repository.dart';
import 'package:yourdiamonds/domain/usecases/get_carat.dart';
import 'package:yourdiamonds/domain/usecases/get_diamond.dart';
import 'package:yourdiamonds/domain/usecases/get_filters.dart';
import 'package:yourdiamonds/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:yourdiamonds/presentation/bloc/dataset_bloc/dataset_bloc.dart';
import 'package:yourdiamonds/presentation/bloc/diamond_bloc/diamond_bloc.dart';
import 'package:yourdiamonds/presentation/bloc/filter_bloc/filters_bloc.dart';
import 'data/data_sources/local_data_source.dart';
import 'data/repositories/dataset_repositories/dataset_repository_impl.dart';
import 'domain/repositories/dataset_repository.dart';
import 'domain/usecases/get_dataset.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void setupLocator() {

  // bloc
  locator.registerFactory(() => DataSetBloc(locator()));
  locator.registerFactory(() => DiamondBloc(locator()));
  locator.registerFactory(() => FiltersBloc(locator()));
  locator.registerFactory(() => CartBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetDataSetUseCase(locator()));
  locator.registerLazySingleton(() => GetDiamondUseCase(locator()));
  locator.registerLazySingleton(() => GetFiltersUseCase(locator()));
  locator.registerLazySingleton(() => GetCaratUseCase(locator()));

  // repository
  locator.registerLazySingleton<DataSetRepository>(
    () => DataSetRepositoryImpl(
      dataSetLocalDataSource: locator()
    ),
  );
  locator.registerLazySingleton<DiamondRepository>(
        () => DiamondRepositoryImpl(
        dataSetLocalDataSource: locator()
    ),
  );
  locator.registerLazySingleton<FiltersRepository>(
        () => FiltersRepositoryImpl(
        dataSetLocalDataSource: locator()
    ),
  );
  locator.registerLazySingleton<CartRepository>(
        () => CartRepositoryImpl(
        dataSetLocalDataSource: locator()
    ),
  );

  // data source
  locator.registerLazySingleton<DataSetLocalDataSource>(
    () => DataSetLocalDataSourceImpl(),
  );
  
  // external
  locator.registerLazySingleton(() => http.Client());
}