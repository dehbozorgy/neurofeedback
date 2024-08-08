import 'package:hive/hive.dart';

part 'TableFz.g.dart';

@HiveType(typeId: 4)
class TableFz {

  @HiveField(0)
  final String? date;

  @HiveField(1)
  final double? Delta_Ec;

  @HiveField(2)
  final double? Lo_Alpha;

  @HiveField(3)
  final double? Hi_Alpha;

  @HiveField(4)
  final double? Hi_Beta;

  @HiveField(5)
  final double? Beta_Ec;

  @HiveField(6)
  final double? Beta_Eo;

  const TableFz({this.date,this.Delta_Ec,this.Lo_Alpha,this.Hi_Alpha,this.Hi_Beta,this.Beta_Ec,this.Beta_Eo});

}