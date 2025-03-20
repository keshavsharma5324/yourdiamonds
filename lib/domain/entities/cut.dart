import 'package:hive/hive.dart';
part 'cut.g.dart';

@HiveType(typeId: 4)
enum Cut {
  @HiveField(0)
  EX,
  @HiveField(1)
  G,
  @HiveField(3)
  VG
}