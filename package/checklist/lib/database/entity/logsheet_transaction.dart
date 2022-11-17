import 'package:drift/drift.dart';

class LogsheetTransaction extends Table {

  IntColumn get id => integer().autoIncrement()();

  TextColumn get userId => text()();
  IntColumn get companyId => integer()();
  TextColumn get companyName => text()();
  IntColumn get locationId => integer()();
  TextColumn get locationName => text()();
  IntColumn get buildingId => integer()();
  TextColumn get buildingName => text()();
  IntColumn get floorId => integer()();
  TextColumn get floorName => text()();
  IntColumn get wingId => integer()();
  TextColumn get wingName => text()();
  IntColumn get sectorId => integer()();
  IntColumn get auditId => integer()();
  TextColumn get auditName => text()();
  IntColumn get categoryId => integer()();
  TextColumn get categoryName => text()();
  IntColumn get equipmentTemplateId => integer()();
  IntColumn get equipmentId => integer()();

  IntColumn get slotId => integer()();
  TextColumn get submitStartTime => text()();
  TextColumn get submitEndTime => text()();
  IntColumn get submitInterval => integer()();
  TextColumn get deviceId => text()();
  TextColumn get guid => text()();
  TextColumn get submitDateTime => text()();
  TextColumn get submitDate => text()();
  TextColumn get signature => text()();
  TextColumn get supervisorName => text()();
  TextColumn get remark => text()();


  TextColumn get barcode => text()();

  BoolColumn get isSync => boolean().withDefault(const Constant(false))();
  BoolColumn get isSyncing => boolean().withDefault(const Constant(false))();

  TextColumn get logsheets => text()();

  TextColumn get submitImages => text()();
  BoolColumn get isOnOff => boolean()();


}
