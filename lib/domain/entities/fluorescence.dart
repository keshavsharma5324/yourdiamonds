import 'package:hive/hive.dart';
part 'fluorescence.g.dart';

@HiveType(typeId: 5)
enum Fluorescence {
  @HiveField(0)
  FNT,
  @HiveField(1)
  MED,
  @HiveField(2)
  NON,
  @HiveField(3)
  SLT,
  @HiveField(4)
  STG,
  @HiveField(5)
  VST
}