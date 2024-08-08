// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TableFz.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TableFzAdapter extends TypeAdapter<TableFz> {
  @override
  final int typeId = 4;

  @override
  TableFz read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TableFz(
      date: fields[0] as String?,
      Delta_Ec: fields[1] as double?,
      Lo_Alpha: fields[2] as double?,
      Hi_Alpha: fields[3] as double?,
      Hi_Beta: fields[4] as double?,
      Beta_Ec: fields[5] as double?,
      Beta_Eo: fields[6] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, TableFz obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.Delta_Ec)
      ..writeByte(2)
      ..write(obj.Lo_Alpha)
      ..writeByte(3)
      ..write(obj.Hi_Alpha)
      ..writeByte(4)
      ..write(obj.Hi_Beta)
      ..writeByte(5)
      ..write(obj.Beta_Ec)
      ..writeByte(6)
      ..write(obj.Beta_Eo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TableFzAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
