import 'package:equatable/equatable.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';
import 'package:yourdiamonds/domain/entities/filters.dart';

abstract class DataSetState extends Equatable {
  const DataSetState();

  @override
  List<Object?> get props => [];
}

class DataSetEmpty extends DataSetState {}

class DataSetLoading extends DataSetState {}

class DataSetLoaded extends DataSetState {
  final List<DiamondEntity?> result;

  const DataSetLoaded(this.result,);

  @override
  List<Object?> get props => [result];
}


class DataSetLoadFailure extends DataSetState {
  final String message;

  const DataSetLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}
