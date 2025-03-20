// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartEntityAdapter extends TypeAdapter<CartEntity> {
  @override
  final int typeId = 1;

  @override
  CartEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartEntity(
      diamonds: (fields[0] as List?)?.cast<DiamondEntity?>(),
    );
  }

  @override
  void write(BinaryWriter writer, CartEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.diamonds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
