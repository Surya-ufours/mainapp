import 'package:drift/drift.dart';

class Score extends Table {

  IntColumn get id => integer().autoIncrement()();
  TextColumn get colourcode => text()();
  TextColumn get score => text()();
  TextColumn get scorename => text()();
  IntColumn get orderno => integer()();
  IntColumn get auditid => integer()();
  IntColumn get scoreid => integer()();

}
