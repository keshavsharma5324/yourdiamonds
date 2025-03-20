import 'package:equatable/equatable.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';
import 'package:yourdiamonds/domain/entities/filters.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object?> get props => [];
}

class OnFilter extends FilterEvent {

  const OnFilter();

  @override
  List<Object?> get props => [];
}


class OnSaveFilter extends FilterEvent {
  final List<DiamondEntity?>? diamonds;
  const OnSaveFilter({this.diamonds});


  @override
  List<Object?> get props => [diamonds];
}

class OnUpdateFilters extends FilterEvent {
  final FiltersEntity entity;
  const OnUpdateFilters(this.entity);


  @override
  List<Object?> get props => [entity];
}

class OnFilterResults extends FilterEvent {
  final FiltersEntity entity;

  const OnFilterResults(this.entity);

  @override
  List<Object?> get props => [entity];
}

