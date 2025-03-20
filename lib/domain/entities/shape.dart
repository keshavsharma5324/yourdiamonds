import 'package:hive/hive.dart';
part 'shape.g.dart';

@HiveType(typeId: 7)
enum Shape {
  @HiveField(0)
  Any,
  @HiveField(1)
  BR,
  @HiveField(2)
  CU,
  @HiveField(3)
  EM,
  @HiveField(4)
  HS,
  @HiveField(5)
  MQ,
  @HiveField(6)
  OV,
  @HiveField(7)
  PR,
  @HiveField(8)
  PS,
  @HiveField(9)
  RAD
}