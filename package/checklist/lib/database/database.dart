import 'dart:developer';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'entity/barcode.dart';
import 'entity/checklist_transaction.dart';
import 'entity/logsheet_transaction.dart';
import 'entity/parameter.dart';
import 'entity/question.dart';
import 'entity/score.dart';
import 'entity/sub_parameter.dart';
import 'entity/template.dart';
import 'entity/template_detail.dart';
import 'entity/user.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'greenchecklist_db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [
  Barcode,
  ChecklistTransaction,
  LogsheetTransaction,
  Parameter,
  Question,
  Score,
  SubParameter,
  Template,
  TemplateDetail,
  User
])
class GCAppDb extends _$GCAppDb {
  GCAppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
