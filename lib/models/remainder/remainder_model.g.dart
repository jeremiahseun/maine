// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remainder_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RemainderModelAdapter extends TypeAdapter<RemainderModel> {
  @override
  final int typeId = 0;

  @override
  RemainderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RemainderModel(
      remainderTitle: fields[0] as String?,
      remainderDescription: fields[1] as String?,
      remainderColor: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, RemainderModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.remainderTitle)
      ..writeByte(1)
      ..write(obj.remainderDescription)
      ..writeByte(2)
      ..write(obj.remainderColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RemainderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
