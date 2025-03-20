import 'package:hive/hive.dart';
part 'clarity.g.dart';

@HiveType(typeId: 3)
enum Clarity {
  @HiveField(0)
  Any,
  @HiveField(1)
  FL,
  @HiveField(2)
  I1,
  @HiveField(3)
  IF,
  @HiveField(4)
  SI1,
  @HiveField(5)
  SI2,
  @HiveField(6)
  VS1,
  @HiveField(7)
  VS2,
  @HiveField(8)
  VVS1,
  @HiveField(9)
  VVS2
}