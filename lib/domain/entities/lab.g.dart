// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LabAdapter extends TypeAdapter<Lab> {
  @override
  final int typeId = 6;

  @override
  Lab read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Lab.Any;
      case 1:
        return Lab.GIA;
      case 2:
        return Lab.HRD;
      case 3:
        return Lab.IN_HOUSE;
      default:
        return Lab.Any;
    }
  }

  @override
  void write(BinaryWriter writer, Lab obj) {
    switch (obj) {
      case Lab.Any:
        writer.writeByte(0);
        break;
      case Lab.GIA:
        writer.writeByte(1);
        break;
      case Lab.HRD:
        writer.writeByte(2);
        break;
      case Lab.IN_HOUSE:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LabAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
