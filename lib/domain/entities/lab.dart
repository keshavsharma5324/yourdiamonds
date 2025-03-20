import 'package:hive/hive.dart';
part 'lab.g.dart';

@HiveType(typeId: 6)
enum Lab {
  @HiveField(0)
  Any,
  @HiveField(1)
  GIA,
  @HiveField(2)
  HRD,
  @HiveField(3)
  IN_HOUSE
}