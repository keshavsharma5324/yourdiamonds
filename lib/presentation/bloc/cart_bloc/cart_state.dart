import 'package:equatable/equatable.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';
import 'package:yourdiamonds/domain/entities/filters.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class CartEmpty extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<DiamondEntity?> result;

  const CartLoaded(this.result,);

  @override
  List<Object?> get props => [result];
}


class CartLoadFailure extends CartState {
  final String message;

  const CartLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}
