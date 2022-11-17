import 'package:drift/drift.dart';

class Question extends Table {
  IntColumn get id => integer().autoIncrement()();

  BoolColumn get isNightActivity => boolean()();

  BoolColumn get isSaturdayReq => boolean()();

  BoolColumn get isSundayReq => boolean()();

  TextColumn get endtime => text()();

  TextColumn get starttime => text()();

  TextColumn get guid => text()();

  TextColumn get imageBase64 => text().withDefault(const Constant(""))();

  TextColumn get questionimage => text()();

  TextColumn get colourcode => text()();

  TextColumn get enddate => text()();

  TextColumn get categoryname => text()();

  TextColumn get startdate => text()();

  TextColumn get auditname => text()();

  TextColumn get WingShortName => text()();

  TextColumn get WingName => text()();

  TextColumn get FloorShortName => text()();

  TextColumn get FloorName => text()();

  TextColumn get BuildingShortName => text()();

  TextColumn get BuildingName => text()();

  TextColumn get LocationName => text()();

  TextColumn get CompanyName => text()();

  TextColumn get auditqname => text()();

  IntColumn get userid => integer()();

  IntColumn get interval => integer()();

  IntColumn get sectorid => integer()();

  IntColumn get score => integer()();

  IntColumn get scoreid => integer()();

  IntColumn get categoryid => integer()();

  IntColumn get auditid => integer()();

  IntColumn get WingID => integer()();

  IntColumn get FloorID => integer()();

  IntColumn get BuildingID => integer()();

  IntColumn get LocationID => integer()();

  IntColumn get CompanyID => integer()();

  IntColumn get auditqid => integer()();
}
