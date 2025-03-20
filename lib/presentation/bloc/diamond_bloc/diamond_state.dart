import 'package:equatable/equatable.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';
import 'package:yourdiamonds/domain/entities/filters.dart';

abstract class DiamondState extends Equatable {
  const DiamondState();

  @override
  List<Object?> get props => [];
}

class DiamondEmpty extends DiamondState {}

class DiamondLoading extends DiamondState {}

class DiamondLoaded extends DiamondState {
  final DiamondEntity result;

  const DiamondLoaded(this.result,);

  @override
  List<Object?> get props => [result];
}

class DiamondLoadFailure extends DiamondState {
  final String message;

  const DiamondLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}
