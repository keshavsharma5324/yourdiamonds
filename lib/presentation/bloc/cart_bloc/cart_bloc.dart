import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yourdiamonds/domain/usecases/get_carat.dart';
import 'package:yourdiamonds/presentation/bloc/cart_bloc/cart_event.dart';
import 'package:yourdiamonds/presentation/bloc/cart_bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent,CartState> {

  final GetCaratUseCase _getCaratUseCase;

  CartBloc(this._getCaratUseCase) : super(CartEmpty()) {
    on<OnSaveCart>(
          (event, emit) async {
        emit(CartLoading());
        final result = await _getCaratUseCase.executeSave(event.diamonds ?? []);
        result.fold(
              (failure) {
            emit(CartLoadFailure(failure.message));
          },
              (data) {
            emit(CartLoaded(data.diamonds!));
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
    on<OnCart>(
          (event, emit) async {
        emit(CartLoading());
        final result = await _getCaratUseCase.getSavedResults();
        result.fold(
              (failure) {
            emit(CartLoadFailure(failure.message));
          },
              (data) {
            emit(CartLoaded(data.diamonds ?? []));
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