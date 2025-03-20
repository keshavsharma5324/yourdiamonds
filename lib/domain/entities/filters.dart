import 'package:equatable/equatable.dart';
import 'package:yourdiamonds/domain/entities/clarity.dart';
import 'package:yourdiamonds/domain/entities/lab.dart';
import 'package:yourdiamonds/domain/entities/shape.dart';

class FiltersEntity extends Equatable {
  final List<double?>? carat;
  final List<Lab?>? lab;
  final List<Shape?>? shape;
  final List<String?>? color;
  final List<Clarity?>? clarity;
  final String? type;

  const FiltersEntity(
      {this.carat, this.lab, this.shape, this.color, this.clarity, this.type});

  @override
  List<Object?> get props => [
        carat,
        lab,
        shape,
        color,
        clarity,
        type,
      ];
}
