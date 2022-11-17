import '../database.dart';

class ScoreDao{
  final GCAppDb _db;
  ScoreDao(this._db);


  insert(List<ScoreCompanion> res) async{
    await _db.batch((batch) => batch.insertAll(_db.score, res));
  }

  Future<List<ScoreData>> getScore(int auditId) async{
    return await (_db.select(_db.score)..where((tbl) => tbl.auditid.equals(auditId))).get();
  }

  deleteAll() async{
    await _db.delete(_db.score).go();
  }

}
