import 'package:hive/hive.dart';
import '/ModelDataBase/TableUser.dart';

Future<List<TableUser>> get GetAllUser async {
  var tbl = await Hive.openBox<TableUser>('TableUser');
  List<TableUser> data = tbl.values.toList();
  await tbl.close();
  return data;
}

Future UpdateUser(int index,TableUser value) async {
  var tbl = await Hive.openBox<TableUser>('TableUser');
  await tbl.putAt(index, value);
  await tbl.close();
}

Future<int> GetIndexUser(TableUser data) async {
  List<TableUser> AllUser = await GetAllUser;
  return AllUser.indexWhere((element) => element.name==data.name && element.family==data.family && element.mobile==data.mobile && element.gender==data.gender);
}

Future<TableUser> GetUserByUser(TableUser data) async {
  List<TableUser> AllUser = await GetAllUser;
  return AllUser.firstWhere((element) => element.name==data.name && element.family==data.family && element.mobile==data.mobile && element.gender==data.gender);
}

Future SaveUser(TableUser data) async {
  var tbl = await Hive.openBox<TableUser>('TableUser');
  await tbl.add(data);
  await tbl.close();
}