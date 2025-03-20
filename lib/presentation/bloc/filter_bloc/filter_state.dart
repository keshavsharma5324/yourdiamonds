import 'package:equatable/equatable.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';
import 'package:yourdiamonds/domain/entities/filters.dart';

abstract class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object?> get props => [];
}

class FilterEmpty extends FilterState {}

class FilterLoading extends FilterState {}

class FilterLoaded extends FilterState {
  final List<DiamondEntity?> result;

  const FilterLoaded(this.result,);

  @override
  List<Object?> get props => [result];
}

class FiltersLoaded extends FilterState {
  final FiltersEntity? result;

  const FiltersLoaded(this.result);

  @override
  List<Object?> get props => [result];
}


class FilterLoadFailure extends FilterState {
  final String message;

  const FilterLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}
