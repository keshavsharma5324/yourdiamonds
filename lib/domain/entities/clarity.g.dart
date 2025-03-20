// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clarity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClarityAdapter extends TypeAdapter<Clarity> {
  @override
  final int typeId = 3;

  @override
  Clarity read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Clarity.Any;
      case 1:
        return Clarity.FL;
      case 2:
        return Clarity.I1;
      case 3:
        return Clarity.IF;
      case 4:
        return Clarity.SI1;
      case 5:
        return Clarity.SI2;
      case 6:
        return Clarity.VS1;
      case 7:
        return Clarity.VS2;
      case 8:
        return Clarity.VVS1;
      case 9:
        return Clarity.VVS2;
      default:
        return Clarity.Any;
    }
  }

  @override
  void write(BinaryWriter writer, Clarity obj) {
    switch (obj) {
      case Clarity.Any:
        writer.writeByte(0);
        break;
      case Clarity.FL:
        writer.writeByte(1);
        break;
      case Clarity.I1:
        writer.writeByte(2);
        break;
      case Clarity.IF:
        writer.writeByte(3);
        break;
      case Clarity.SI1:
        writer.writeByte(4);
        break;
      case Clarity.SI2:
        writer.writeByte(5);
        break;
      case Clarity.VS1:
        writer.writeByte(6);
        break;
      case Clarity.VS2:
        writer.writeByte(7);
        break;
      case Clarity.VVS1:
        writer.writeByte(8);
        break;
      case Clarity.VVS2:
        writer.writeByte(9);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClarityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
