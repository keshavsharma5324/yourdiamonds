import 'package:equatable/equatable.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';
import 'package:yourdiamonds/domain/entities/filters.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class OnCart extends CartEvent {

  const OnCart();

  @override
  List<Object?> get props => [];
}


class OnSaveCart extends CartEvent {
  final List<DiamondEntity?>? diamonds;
  const OnSaveCart({this.diamonds});


  @override
  List<Object?> get props => [diamonds];
}


