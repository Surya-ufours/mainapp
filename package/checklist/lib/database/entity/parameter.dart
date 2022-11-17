import 'package:drift/drift.dart';

class Parameter extends Table {

  IntColumn get id => integer().autoIncrement()();
  BoolColumn get issubparamavailable => boolean()();
  TextColumn get guid => text()();
  TextColumn get templatename => text()();
  TextColumn get equipmentname => text()();
  TextColumn get parametername => text()();
  TextColumn get ParameterLimits => text()();
  IntColumn get userid => integer()();
  IntColumn get auditid => integer()();
  IntColumn get buildingid => integer()();
  IntColumn get locationid => integer()();
  IntColumn get equipmentparamid => integer()();
  IntColumn get equipmentnameid => integer()();
  IntColumn get equipmenttemplateid => integer()();

  //user value for user input store
}
