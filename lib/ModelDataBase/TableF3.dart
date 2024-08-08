import 'package:hive/hive.dart';

part 'TableF3.g.dart';

@HiveType(typeId: 2)
class TableF3 {

  @HiveField(0)
  final String? date;

  @HiveField(1)
  final double? Theta_Ec;

  @HiveField(2)
  final double? Alpha_Ec;

  @HiveField(3)
  final double? Beta_Ec;

  const TableF3({this.date,this.Theta_Ec,this.Alpha_Ec,this.Beta_Ec});

}