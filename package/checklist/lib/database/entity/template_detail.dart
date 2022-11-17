import 'package:drift/drift.dart';


class TemplateDetail extends Table {

  IntColumn get id => integer().autoIncrement()();
  IntColumn get UserID => integer()();

  TextColumn get equipmentname => text()();

  IntColumn get equipmentnameid => integer()();

  TextColumn get templatename => text()();

  IntColumn get equipmenttemplateid => integer()();

  TextColumn get guid => text()();

  IntColumn get interval => integer()();

  TextColumn get endtime => text()();

  TextColumn get starttime => text()();

  TextColumn get categoryname => text()();

  IntColumn get categoryid => integer()();

  TextColumn get auditname => text()();

  IntColumn get auditid => integer()();

  TextColumn get wingname => text()();

  IntColumn get wingid => integer()();

  TextColumn get floorname => text()();

  IntColumn get floorid => integer()();

  TextColumn get buildingname => text()();

  IntColumn get BuildingID => integer()();

  TextColumn get LocationName => text()();

  IntColumn get locationid => integer()();

  IntColumn get sectorid => integer()();

  TextColumn get companyname => text()();

  IntColumn get companyid => integer()();
}
