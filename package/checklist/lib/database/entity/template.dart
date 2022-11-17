import 'package:drift/drift.dart';

class Template extends Table {

  IntColumn get id => integer().autoIncrement()();
  TextColumn get templatename => text()();
  TextColumn get categoryname => text()();
  TextColumn get guid => text()();
  IntColumn get templateid => integer()();
  IntColumn get categoryid => integer()();

  BoolColumn get isSaturdayReq => boolean()();
  BoolColumn get isSundayReq => boolean()();

}
