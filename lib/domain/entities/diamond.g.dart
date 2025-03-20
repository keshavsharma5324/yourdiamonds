// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diamond.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiamondEntityAdapter extends TypeAdapter<DiamondEntity> {
  @override
  final int typeId = 2;

  @override
  DiamondEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DiamondEntity(
      qty: fields[0] as int?,
      lotId: fields[1] as String?,
      size: fields[2] as String?,
      carat: fields[3] as double?,
      lab: fields[4] as Lab?,
      shape: fields[5] as Shape?,
      color: fields[6] as String?,
      clarity: fields[7] as Clarity?,
      cut: fields[8] as Cut?,
      polish: fields[9] as Cut?,
      symmetry: fields[10] as Cut?,
      fluorescence: fields[11] as Fluorescence?,
      discount: fields[12] as double?,
      perCaratRate: fields[13] as double?,
      finalAmount: fields[14] as double?,
      keyToSymbol: fields[15] as String?,
      labComment: fields[16] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DiamondEntity obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.qty)
      ..writeByte(1)
      ..write(obj.lotId)
      ..writeByte(2)
      ..write(obj.size)
      ..writeByte(3)
      ..write(obj.carat)
      ..writeByte(4)
      ..write(obj.lab)
      ..writeByte(5)
      ..write(obj.shape)
      ..writeByte(6)
      ..write(obj.color)
      ..writeByte(7)
      ..write(obj.clarity)
      ..writeByte(8)
      ..write(obj.cut)
      ..writeByte(9)
      ..write(obj.polish)
      ..writeByte(10)
      ..write(obj.symmetry)
      ..writeByte(11)
      ..write(obj.fluorescence)
      ..writeByte(12)
      ..write(obj.discount)
      ..writeByte(13)
      ..write(obj.perCaratRate)
      ..writeByte(14)
      ..write(obj.finalAmount)
      ..writeByte(15)
      ..write(obj.keyToSymbol)
      ..writeByte(16)
      ..write(obj.labComment);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiamondEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
