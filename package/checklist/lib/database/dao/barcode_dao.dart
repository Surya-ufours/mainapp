import 'dart:developer';

import 'package:drift/drift.dart';

import '../database.dart';

class BarcodeDao {
  final GCAppDb _db;

  BarcodeDao(this._db);

  insert(List<BarcodeCompanion> barcodes) async {
    await _db.batch((batch) => batch.insertAll(_db.barcode, barcodes));
  }

  getBarcode(String barcode) async {
    return await (_db.select(_db.barcode)
          ..where((tbl) => tbl.guid.equals(barcode)))
        .getSingleOrNull();
  }

  getBarcodeSql(String barcode, int deptId) async {
    log('$barcode -- $deptId');
    return await _db.customSelect(
      "SELECT * FROM barcode WHERE guid=(SELECT guid FROM question WHERE question.guid=? AND question.auditid=? LIMIT 1) OR guid=(SELECT guid FROM template_detail WHERE template_detail.guid=? AND template_detail.auditid=? LIMIT 1)",
      variables: [
        Variable.withString(barcode),
        Variable.withInt(deptId),
        Variable.withString(barcode),
        Variable.withInt(deptId)
      ],
      readsFrom: {_db.barcode, _db.question, _db.template},
    ).map((res) =>
      BarcodeData(
          id: res.data['id'],
          imagecount: res.data['imagecount'],
          islogsheet: res.data['islogsheet'] == 1,
          ischecklist: res.data['ischecklist'] == 1,
          guid: res.data['guid'])
    ).getSingleOrNull();
  }

  getBarcodeCount() async {
    var exp = _db.barcode.id.count();
    final q = _db.selectOnly(_db.barcode)..addColumns([exp]);
    return await q.map((p0) => p0.read(exp)).getSingle();
  }

  getBarcodeImageCount(String barcode) async {
    return await (_db.select(_db.barcode)
          ..where((tbl) => tbl.guid.equals(barcode)))
        .getSingle();
  }

  deleteAll() async {
    await _db.delete(_db.barcode).go();
  }
}
