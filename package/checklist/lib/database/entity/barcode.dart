import 'package:drift/drift.dart';

class Barcode extends Table {

  IntColumn get id => integer().autoIncrement()();
  TextColumn get guid => text()();
  BoolColumn get islogsheet => boolean()();
  BoolColumn get ischecklist => boolean()();
  IntColumn get imagecount => integer()();

}


