import 'package:hive/hive.dart';

part 'TableF4.g.dart';

@HiveType(typeId: 3)
class TableF4 {

  @HiveField(0)
  final String? date;

  @HiveField(1)
  final double? Theta_Ec;

  @HiveField(2)
  final double? Alpha_Ec;

  @HiveField(3)
  final double? Beta_Ec;

  const TableF4({this.date,this.Theta_Ec,this.Alpha_Ec,this.Beta_Ec});

}