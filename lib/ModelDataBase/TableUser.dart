import 'package:hive/hive.dart';
import 'TableCz.dart';
import 'TableF3.dart';
import 'TableF4.dart';
import 'TableFz.dart';
import 'TableO1.dart';

part 'TableUser.g.dart';

@HiveType(typeId: 5)
class TableUser {

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String family;

  @HiveField(2)
  final String birthday;

  @HiveField(3)
  final bool gender;

  @HiveField(4)
  final String? mobile;

  @HiveField(5,defaultValue: [])
  final List<TableCz> ListTableCz;

  @HiveField(6)
  final List<TableO1> ListTableO1;

  @HiveField(7)
  final List<TableF3> ListTableF3;

  @HiveField(8)
  final List<TableF4> ListTableF4;

  @HiveField(9)
  final List<TableFz> ListTableFz;

  TableUser({
    required this.name,
    required this.family,
    required this.birthday,
    required this.gender,
    this.mobile,
    required this.ListTableCz,
    required this.ListTableO1,
    required this.ListTableF3,
    required this.ListTableF4,
    required this.ListTableFz});

}