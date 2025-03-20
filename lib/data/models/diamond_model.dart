import 'package:yourdiamonds/domain/entities/clarity.dart';
import 'package:yourdiamonds/domain/entities/cut.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';
import 'package:yourdiamonds/domain/entities/fluorescence.dart';
import 'package:yourdiamonds/domain/entities/lab.dart';
import 'package:yourdiamonds/domain/entities/shape.dart';

class DiamondModel {
  int? qty;
  String? lotId;
  String? size;
  double? carat;
  Lab? lab;
  Shape? shape;
  String? color;
  Clarity? clarity;
  Cut? cut;
  Cut? polish;
  Cut? symmetry;
  Fluorescence? fluorescence;
  double? discount;
  double? perCaratRate;
  double? finalAmount;
  String? keyToSymbol;
  String? labComment;

  DiamondModel({
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

  factory DiamondModel.fromJson(Map<String?, dynamic> json) => DiamondModel(
      qty: json['Qty'],
      lotId: json['Lot ID'] != null ? json['Size'] : null,
      size: json['Size'] != null ? json['Size'] : null,
      carat: double.tryParse(json['Carat'].toString()),
      lab: json['Lab'] != null
          ? Lab.values.firstWhere(
              (e) => e.name == json['Lab'] || json['Lab'] == "In-House")
          : null,
      shape: json['Shape'] != null
          ? Shape.values.firstWhere((e) => e.name == json['Shape'])
          : null,
      color: json['Color'],
      clarity: json['Clarity'] != null
          ? Clarity.values.firstWhere((e) => e.name == json['Clarity'])
          : null,
      cut: json['Cut'] != null
          ? Cut.values.firstWhere((e) => e.name == json['Cut'])
          : null,
      polish: json['Polish'] != null
          ? Cut.values.firstWhere((e) => e.name == json['Polish'])
          : null,
      symmetry: json['Symmetry'] != null
          ? Cut.values.firstWhere((e) => e.name == json['Symmetry'])
          : null,
      fluorescence: json['Fluorescence'] != null
          ? Fluorescence.values
          .firstWhere((e) => e.name == json['Fluorescence'])
          : null,
      discount: double.tryParse(json['Discount'].toString()),
      perCaratRate: double.tryParse(json['Per Carat Rate'].toString()),
      finalAmount: double.tryParse(json['Final Amount'].toString()),
      keyToSymbol: json['Key To Symbol'] ?? '',
      labComment: json['Lab Comment'] ?? '');

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Qty'] = this.qty;
    data['Lot ID'] = this.lotId;
    data['Size'] = this.size;
    data['Carat'] = this.carat;
    data['Lab'] = this.lab;
    data['Shape'] = this.shape;
    data['Color'] = this.color;
    data['Clarity'] = this.clarity;
    data['Cut'] = this.cut;
    data['Polish'] = this.polish;
    data['Symmetry'] = this.symmetry;
    data['Fluorescence'] = this.fluorescence;
    data['Discount'] = this.discount;
    data['Per Carat Rate'] = this.perCaratRate;
    data['Final Amount'] = this.finalAmount;
    data['Key To Symbol'] = this.keyToSymbol;
    data['Lab Comment'] = this.labComment;
    return data;
  }

  DiamondEntity toEntity() => DiamondEntity(
      qty: qty,
      lotId: lotId,
      size: size,
      carat: carat,
      lab: lab,
      shape: shape,
      clarity: clarity,
      color: color,
      cut: cut,
      perCaratRate: perCaratRate,
      polish: polish,
      symmetry: symmetry,
      discount: discount,
      finalAmount: finalAmount,
      fluorescence: fluorescence,
      keyToSymbol: keyToSymbol,
      labComment: labComment);
}