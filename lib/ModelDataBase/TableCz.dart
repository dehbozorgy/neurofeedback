import 'package:hive/hive.dart';

part 'TableCz.g.dart';

@HiveType(typeId: 0)
class TableCz {

  @HiveField(0)
  final String? date;

  @HiveField(1)
  final double? Theta_Eo;

  @HiveField(2)
  final double? Alpha_Eo;

  @HiveField(3)
  final double? SMR_Eo;

  @HiveField(4)
  final double? Beta_Eo;

  @HiveField(5)
  final double? Theta_Ec;

  @HiveField(6)
  final double? Alpha_Ec;

  @HiveField(7)
  final double? SMR_Ec;

  @HiveField(8)
  final double? Beta_Ec;

  @HiveField(9)
  final double? Alpha_after;

  @HiveField(10)
  final double? Theta_UT;

  @HiveField(11)
  final double? Beta_UT;


  const TableCz({
    this.date,
    this.Theta_Eo,
    this.Alpha_Eo,
    this.SMR_Eo,
    this.Beta_Eo,
    this.Theta_Ec,
    this.Alpha_Ec,
    this.SMR_Ec,
    this.Beta_Ec,
    this.Alpha_after,
    this.Theta_UT,
    this.Beta_UT});

}