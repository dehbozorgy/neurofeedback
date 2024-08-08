// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TableF4.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TableF4Adapter extends TypeAdapter<TableF4> {
  @override
  final int typeId = 3;

  @override
  TableF4 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TableF4(
      date: fields[0] as String?,
      Theta_Ec: fields[1] as double?,
      Alpha_Ec: fields[2] as double?,
      Beta_Ec: fields[3] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, TableF4 obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.Theta_Ec)
      ..writeByte(2)
      ..write(obj.Alpha_Ec)
      ..writeByte(3)
      ..write(obj.Beta_Ec);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TableF4Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
