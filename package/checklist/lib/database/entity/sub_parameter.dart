import 'package:drift/drift.dart';

class SubParameter extends Table {

  IntColumn get id => integer().autoIncrement()();
  TextColumn get ParameterLimits => text()();
  TextColumn get equiplimits => text()();
  TextColumn get equipsubparamname => text()();
  TextColumn get parametername => text()();
  TextColumn get equipmentname => text()();
  TextColumn get templatename => text()();
  IntColumn get equiplimitid => integer()();
  IntColumn get equipsubparamid => integer()();
  IntColumn get equipmentparamid => integer()();
  IntColumn get equipmentnameid => integer()();
  IntColumn get equiptemplateid => integer()();
  BoolColumn get issubparamavailable => boolean()();

  //userValue for user input
}
