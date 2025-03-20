import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:yourdiamonds/domain/entities/clarity.dart';
import 'package:yourdiamonds/domain/entities/cut.dart';
import 'package:yourdiamonds/domain/entities/fluorescence.dart';
import 'package:yourdiamonds/domain/entities/shape.dart';

import 'lab.dart';
part 'diamond.g.dart';

@HiveType(typeId: 2)
class DiamondEntity extends Equatable {
  @HiveField(0)
  int? qty;
  @HiveField(1)
  String? lotId;
  @HiveField(2)
  String? size;
  @HiveField(3)
  double? carat;
  @HiveField(4)
  Lab? lab;
  @HiveField(5)
  Shape? shape;
  @HiveField(6)
  String? color;
  @HiveField(7)
  Clarity? clarity;
  @HiveField(8)
  Cut? cut;
  @HiveField(9)
  Cut? polish;
  @HiveField(10)
  Cut? symmetry;
  @HiveField(11)
  Fluorescence? fluorescence;
  @HiveField(12)
  double? discount;
  @HiveField(13)
  double? perCaratRate;
  @HiveField(14)
  double? finalAmount;
  @HiveField(15)
  String? keyToSymbol;
  @HiveField(16)
  String? labComment;

  DiamondEntity({
  this.qty,
  this.lotId,
  this.size,
  this.carat,
  this.lab,
  this.shape,
  this.color,
  this.clarity,
  this.cut,
  this.polish,
  this.symmetry,
  this.fluorescence,
  this.discount,
  this.perCaratRate,
  this.finalAmount,
  this.keyToSymbol,
  this.labComment,
  });


  @override
  List < Object ? > get props => [
    qty,
    lotId,
    size,
    carat,
    lab,
    shape,
    color,
    clarity,
    cut,
    polish,
    symmetry,
    fluorescence,
    discount,
    perCaratRate,
    finalAmount,
    keyToSymbol,
    labComment
  ];
}
