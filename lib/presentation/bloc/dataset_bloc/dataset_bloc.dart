import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yourdiamonds/domain/usecases/get_dataset.dart';
import 'package:yourdiamonds/presentation/bloc/dataset_bloc/dataset_event.dart';
import 'package:yourdiamonds/presentation/bloc/dataset_bloc/dataset_state.dart';

class DataSetBloc extends Bloc<DataSetEvent,DataSetState> {

  final GetDataSetUseCase _getCurrentDataSetUseCase;

  DataSetBloc(this._getCurrentDataSetUseCase) : super(DataSetEmpty()) {
    on<OnDataSet>(
          (event, emit) async {
        emit(DataSetLoading());
        final result = await _getCurrentDataSetUseCase.execute();

        result.fold(
              (failure) {
            emit(DataSetLoadFailure(failure.message));
          },
              (data) {
            emit(DataSetLoaded(data,));
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