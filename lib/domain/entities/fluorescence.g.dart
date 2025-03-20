// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fluorescence.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FluorescenceAdapter extends TypeAdapter<Fluorescence> {
  @override
  final int typeId = 5;

  @override
  Fluorescence read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Fluorescence.FNT;
      case 1:
        return Fluorescence.MED;
      case 2:
        return Fluorescence.NON;
      case 3:
        return Fluorescence.SLT;
      case 4:
        return Fluorescence.STG;
      case 5:
        return Fluorescence.VST;
      default:
        return Fluorescence.FNT;
    }
  }

  @override
  void write(BinaryWriter writer, Fluorescence obj) {
    switch (obj) {
      case Fluorescence.FNT:
        writer.writeByte(0);
        break;
      case Fluorescence.MED:
        writer.writeByte(1);
        break;
      case Fluorescence.NON:
        writer.writeByte(2);
        break;
      case Fluorescence.SLT:
        writer.writeByte(3);
        break;
      case Fluorescence.STG:
        writer.writeByte(4);
        break;
      case Fluorescence.VST:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FluorescenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
