import 'package:hive/hive.dart';

part 'TableO1.g.dart';

@HiveType(typeId: 1)
class TableO1 {

  @HiveField(0)
  final String? date;

  @HiveField(1)
  final double? Theta_Eo;

  @HiveField(2)
  final double? Alpha_Eo;

  @HiveField(3)
  final double? Beta_Eo;

  @HiveField(4)
  final double? Theta_Ec;

  @HiveField(5)
  final double? Alpha_Ec;

  @HiveField(6)
  final double? Beta_Ec;

  @HiveField(7)
  final double? Alpha_after;

  @HiveField(8)
  final double? Peak_Alpha;

  const TableO1({
    this.date,
    this.Theta_Eo,
    this.Alpha_Eo,
    this.Beta_Eo,
    this.Theta_Ec,
    this.Alpha_Ec,
    this.Beta_Ec,
    this.Alpha_after,
    this.Peak_Alpha});

}