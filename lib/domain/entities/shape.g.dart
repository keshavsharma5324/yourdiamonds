// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shape.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShapeAdapter extends TypeAdapter<Shape> {
  @override
  final int typeId = 7;

  @override
  Shape read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Shape.Any;
      case 1:
        return Shape.BR;
      case 2:
        return Shape.CU;
      case 3:
        return Shape.EM;
      case 4:
        return Shape.HS;
      case 5:
        return Shape.MQ;
      case 6:
        return Shape.OV;
      case 7:
        return Shape.PR;
      case 8:
        return Shape.PS;
      case 9:
        return Shape.RAD;
      default:
        return Shape.Any;
    }
  }

  @override
  void write(BinaryWriter writer, Shape obj) {
    switch (obj) {
      case Shape.Any:
        writer.writeByte(0);
        break;
      case Shape.BR:
        writer.writeByte(1);
        break;
      case Shape.CU:
        writer.writeByte(2);
        break;
      case Shape.EM:
        writer.writeByte(3);
        break;
      case Shape.HS:
        writer.writeByte(4);
        break;
      case Shape.MQ:
        writer.writeByte(5);
        break;
      case Shape.OV:
        writer.writeByte(6);
        break;
      case Shape.PR:
        writer.writeByte(7);
        break;
      case Shape.PS:
        writer.writeByte(8);
        break;
      case Shape.RAD:
        writer.writeByte(9);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShapeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
