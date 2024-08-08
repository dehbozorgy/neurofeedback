// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TableUser.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TableUserAdapter extends TypeAdapter<TableUser> {
  @override
  final int typeId = 5;

  @override
  TableUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TableUser(
      name: fields[0] as String,
      family: fields[1] as String,
      birthday: fields[2] as String,
      gender: fields[3] as bool,
      mobile: fields[4] as String?,
      ListTableCz: fields[5] == null ? [] : (fields[5] as List).cast<TableCz>(),
      ListTableO1: (fields[6] as List).cast<TableO1>(),
      ListTableF3: (fields[7] as List).cast<TableF3>(),
      ListTableF4: (fields[8] as List).cast<TableF4>(),
      ListTableFz: (fields[9] as List).cast<TableFz>(),
    );
  }

  @override
  void write(BinaryWriter writer, TableUser obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.family)
      ..writeByte(2)
      ..write(obj.birthday)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.mobile)
      ..writeByte(5)
      ..write(obj.ListTableCz)
      ..writeByte(6)
      ..write(obj.ListTableO1)
      ..writeByte(7)
      ..write(obj.ListTableF3)
      ..writeByte(8)
      ..write(obj.ListTableF4)
      ..writeByte(9)
      ..write(obj.ListTableFz);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TableUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
