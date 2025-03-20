// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cut.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CutAdapter extends TypeAdapter<Cut> {
  @override
  final int typeId = 4;

  @override
  Cut read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Cut.EX;
      case 1:
        return Cut.G;
      case 3:
        return Cut.VG;
      default:
        return Cut.EX;
    }
  }

  @override
  void write(BinaryWriter writer, Cut obj) {
    switch (obj) {
      case Cut.EX:
        writer.writeByte(0);
        break;
      case Cut.G:
        writer.writeByte(1);
        break;
      case Cut.VG:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CutAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
