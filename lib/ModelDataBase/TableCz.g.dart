// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TableCz.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TableCzAdapter extends TypeAdapter<TableCz> {
  @override
  final int typeId = 0;

  @override
  TableCz read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TableCz(
      date: fields[0] as String?,
      Theta_Eo: fields[1] as double?,
      Alpha_Eo: fields[2] as double?,
      SMR_Eo: fields[3] as double?,
      Beta_Eo: fields[4] as double?,
      Theta_Ec: fields[5] as double?,
      Alpha_Ec: fields[6] as double?,
      SMR_Ec: fields[7] as double?,
      Beta_Ec: fields[8] as double?,
      Alpha_after: fields[9] as double?,
      Theta_UT: fields[10] as double?,
      Beta_UT: fields[11] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, TableCz obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.Theta_Eo)
      ..writeByte(2)
      ..write(obj.Alpha_Eo)
      ..writeByte(3)
      ..write(obj.SMR_Eo)
      ..writeByte(4)
      ..write(obj.Beta_Eo)
      ..writeByte(5)
      ..write(obj.Theta_Ec)
      ..writeByte(6)
      ..write(obj.Alpha_Ec)
      ..writeByte(7)
      ..write(obj.SMR_Ec)
      ..writeByte(8)
      ..write(obj.Beta_Ec)
      ..writeByte(9)
      ..write(obj.Alpha_after)
      ..writeByte(10)
      ..write(obj.Theta_UT)
      ..writeByte(11)
      ..write(obj.Beta_UT);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TableCzAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
