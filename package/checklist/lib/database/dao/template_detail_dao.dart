
import 'package:drift/drift.dart';
import '../database.dart';

class TemplateDetailDao{
  final GCAppDb _db;
  TemplateDetailDao(this._db);


  insert(List<TemplateDetailCompanion> res) async{
    await _db.batch((batch) => batch.insertAll(_db.templateDetail, res));
  }

  Future<List<TemplateDetailData>> getTemplateDetailByDeptId(String guid, int deptid) async{
    return await (_db.select(_db.templateDetail)..where((tbl) => tbl.guid.equals(guid) & tbl.auditid.equals(deptid))).get();
  }

  Future<TemplateDetailData?> getTemplateDetail(String guid, int tempId) async{
    return await (_db.select(_db.templateDetail)..where((tbl) => tbl.guid.equals(guid) & tbl.equipmenttemplateid.equals(tempId))).getSingleOrNull();
  }

  deleteAll() async{
    await _db.delete(_db.templateDetail).go();
  }

}
