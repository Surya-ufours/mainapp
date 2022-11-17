import 'package:drift/drift.dart';


class User extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get AppTypes => text()();

  IntColumn get ProductID => integer()();

  TextColumn get Language => text()();

  TextColumn get RoleShortName => text()();

  TextColumn get mobileno => text()();

  TextColumn get emailid => text()();

  TextColumn get name => text()();

  BoolColumn get islogsheet => boolean()();

  BoolColumn get isadmin => boolean()();

  BoolColumn get ishelpdesk => boolean()();

  BoolColumn get ischecklist => boolean()();

  TextColumn get locationame => text()();

  TextColumn get companylogo => text()();

  TextColumn get companyName => text()();

  TextColumn get userID => text()();

  TextColumn get password => text()();

  IntColumn get locationID => integer()();

  IntColumn get CompanyID => integer()();

  TextColumn get Department => text()();
}
