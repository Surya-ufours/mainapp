import 'package:drift/drift.dart';

class ChecklistTransaction extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get userId => text()();

  IntColumn get companyId => integer()();

  IntColumn get locationId => integer()();

  IntColumn get buildingId => integer()();

  IntColumn get sectorId => integer()();

  IntColumn get floorId => integer()();

  IntColumn get wingId => integer()();

  IntColumn get auditId => integer()();

  IntColumn get categoryId => integer()();

  IntColumn get slotId => integer()();

  TextColumn get submitDateTime => text()();

  TextColumn get submitDate => text()();

  TextColumn get remark => text()();

  TextColumn get signature => text()();

  TextColumn get supervisorName => text()();

  TextColumn get submitStartTime => text()();

  TextColumn get submitEndTime => text()();

  IntColumn get submitInterval => integer()();

  TextColumn get scanStartTime => text()();

  TextColumn get timeTaken => text()();

  TextColumn get qrCode => text()();

  TextColumn get barcode => text()();

  BoolColumn get isAdmin => boolean()();

  TextColumn get guid => text()();

  TextColumn get deviceId => text()();

  BoolColumn get isSync => boolean().withDefault(const Constant(false))();

  BoolColumn get isSyncing => boolean().withDefault(const Constant(false))();

  TextColumn get checklists => text()();

  TextColumn get submitImages => text()();
}
