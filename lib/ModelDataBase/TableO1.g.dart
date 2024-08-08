// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TableO1.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TableO1Adapter extends TypeAdapter<TableO1> {
  @override
  final int typeId = 1;

  @override
  TableO1 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TableO1(
      date: fields[0] as String?,
      Theta_Eo: fields[1] as double?,
      Alpha_Eo: fields[2] as double?,
      Beta_Eo: fields[3] as double?,
      Theta_Ec: fields[4] as double?,
      Alpha_Ec: fields[5] as double?,
      Beta_Ec: fields[6] as double?,
      Alpha_after: fields[7] as double?,
      Peak_Alpha: fields[8] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, TableO1 obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.Theta_Eo)
      ..writeByte(2)
      ..write(obj.Alpha_Eo)
      ..writeByte(3)
      ..write(obj.Beta_Eo)
      ..writeByte(4)
      ..write(obj.Theta_Ec)
      ..writeByte(5)
      ..write(obj.Alpha_Ec)
      ..writeByte(6)
      ..write(obj.Beta_Ec)
      ..writeByte(7)
      ..write(obj.Alpha_after)
      ..writeByte(8)
      ..write(obj.Peak_Alpha);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TableO1Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
