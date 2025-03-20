import 'package:equatable/equatable.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';
import 'package:yourdiamonds/domain/entities/filters.dart';

abstract class DataSetEvent extends Equatable {
  const DataSetEvent();

  @override
  List<Object?> get props => [];
}

class OnDataSet extends DataSetEvent {

  const OnDataSet();

  @override
  List<Object?> get props => [];
}





