import 'package:equatable/equatable.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';
import 'package:yourdiamonds/domain/entities/filters.dart';

abstract class DiamondEvent extends Equatable {
  const DiamondEvent();

  @override
  List<Object?> get props => [];
}

class GetDiamond extends DiamondEvent {
  final DiamondEntity? diamond;
  const GetDiamond({this.diamond});

  @override
  List<Object?> get props => [diamond];
}


class OnDiamondFilters extends DiamondEvent {
  const OnDiamondFilters();


  @override
  List<Object?> get props => [];
}
