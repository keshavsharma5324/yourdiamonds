import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yourdiamonds/domain/usecases/get_filters.dart';
import 'package:yourdiamonds/presentation/bloc/cart_bloc/cart_event.dart';
import 'package:yourdiamonds/presentation/bloc/cart_bloc/cart_state.dart';
import 'package:yourdiamonds/presentation/bloc/filter_bloc/filter_event.dart';
import 'package:yourdiamonds/presentation/bloc/filter_bloc/filter_state.dart';

class FiltersBloc extends Bloc<FilterEvent,FilterState> {

  final GetFiltersUseCase _getFiltersUseCase;

  FiltersBloc(this._getFiltersUseCase) : super(FilterEmpty()) {
    on<OnFilter>(
          (event, emit) async {
        emit(FilterLoading());
        final result = await _getFiltersUseCase.executeFilters();
        result.fold(
              (failure) {
            emit(FilterLoadFailure(failure.message));
          },
              (data) {
            emit(FiltersLoaded(data));
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
    on<OnUpdateFilters>(
          (event, emit) async {
        emit(FilterLoading());
        final result = await _getFiltersUseCase.updateFilters(event.entity);
        result.fold(
              (failure) {
            emit(FilterLoadFailure(failure.message));
          },
              (data) {
            emit(FiltersLoaded(data));
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
    on<OnFilterResults>(
          (event, emit) async {
        emit(FilterLoading());
        final result = await _getFiltersUseCase.getFilteredResult(event.entity);
        result.fold(
              (failure) {
            emit(FilterLoadFailure(failure.message));
          },
              (data) {
            emit(FilterLoaded(data));
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}