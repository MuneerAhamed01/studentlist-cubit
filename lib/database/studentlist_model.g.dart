// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studentlist_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentlistAdapter extends TypeAdapter<Studentlist> {
  @override
  final int typeId = 0;

  @override
  Studentlist read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Studentlist(
      name: fields[0] as String,
      domain: fields[1] as String,
      number: fields[2] as String,
      place: fields[3] as String,
      image: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Studentlist obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.domain)
      ..writeByte(2)
      ..write(obj.number)
      ..writeByte(3)
      ..write(obj.place)
      ..writeByte(4)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentlistAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
