import 'package:drift/drift.dart';

import '../database.dart';

class LogsheetTransactionDao {
  final GCAppDb _db;

  LogsheetTransactionDao(this._db);

  insert(LogsheetTransactionCompanion res) async {
    await _db.into(_db.logsheetTransaction).insert(res);
  }

  Future<List<LogsheetTransactionData>> getAllLogsheetTransaction() async{
    return await (_db.select(_db.logsheetTransaction)..where((tbl) => tbl.isSync.equals(false) & tbl.isSyncing.equals(false))).get();
  }

  updateLogsheetTransaction(String guid) async{
    return _db.update(_db.logsheetTransaction)..write(const LogsheetTransactionCompanion(
      isSync: Value(true),
      isSyncing: Value(false),
    ))..where((tbl) => tbl.guid.equals(guid));
  }

  updateIsSyncing({bool isSyncing=false}) async{
    return _db.update(_db.logsheetTransaction)..write(LogsheetTransactionCompanion(
      isSyncing: Value(isSyncing),
    ));
  }

  Future<Stream<int>> getUnSyncLogsheetCount() async{
    return _db.customSelect(
      "SELECT COUNT(*) as c FROM logsheet_transaction WHERE is_sync=0",
      readsFrom: {_db.logsheetTransaction},
    ).map((res) => res.data['c'] as int).watchSingle();
  }

  countLogsheetTransaction(String barcode, String subDate, String starttime, String endtime, int slotId,int deptid,int wingid) async{
    return await _db.customSelect(
      "SELECT COUNT(id) as c FROM logsheet_transaction WHERE barcode=? AND submit_date=? AND submit_start_time=? AND submit_end_time=? AND slot_id=? AND audit_id=? AND wing_id=?",
      variables: [
        Variable.withString(barcode),
        Variable.withString(subDate),
        Variable.withString(starttime),
        Variable.withString(endtime),
        Variable.withInt(slotId),
        Variable.withInt(deptid),
        Variable.withInt(wingid)
      ],
      readsFrom: {_db.logsheetTransaction},
    ).map((res) => res.data['c'] as int).getSingle();
  }

  deleteAllSync(String today) async{
    await (_db.delete(_db.logsheetTransaction)..where((tbl) => tbl.isSync.equals(true) & tbl.submitDate.equals(today).not())).go();
  }

  deleteAll() async{
    await _db.delete(_db.logsheetTransaction).go();
  }
}
