import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yourdiamonds/domain/usecases/get_diamond.dart';
import 'package:yourdiamonds/presentation/bloc/diamond_bloc/diamond_event.dart';
import 'package:yourdiamonds/presentation/bloc/diamond_bloc/diamond_state.dart';

class DiamondBloc extends Bloc<DiamondEvent,DiamondState> {
  
  final GetDiamondUseCase _getDiamondUseCase;
  DiamondBloc(this._getDiamondUseCase) : super(DiamondEmpty()) {
    on<GetDiamond>(
      (event, emit) async {
        emit(DiamondLoading());
        final result = await _getDiamondUseCase.execute(event.diamond);
        result.fold(
          (failure) {
            emit(DiamondLoadFailure(failure.message));
          },
          (data) {
            emit(DiamondLoaded(data));
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