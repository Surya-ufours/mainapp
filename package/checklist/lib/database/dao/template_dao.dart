
import '../database.dart';

class TemplateDao{
  final GCAppDb _db;
  TemplateDao(this._db);


  insert(List<TemplateCompanion> res) async{
    await _db.batch((batch) => batch.insertAll(_db.template, res));
  }

  Future<TemplateData?> getSatSun(String guid) async{
    return await (_db.select(_db.template)..where((tbl) => tbl.guid.equals(guid))..limit(1)).getSingleOrNull();
  }

  deleteAll() async{
    await _db.delete(_db.template).go();
  }

}
