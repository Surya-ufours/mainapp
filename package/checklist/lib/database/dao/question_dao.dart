
import 'package:drift/drift.dart';
import '../database.dart';

class QuestionDao{
  final GCAppDb _db;
  QuestionDao(this._db);


  insert(List<QuestionCompanion> res) async{
    await _db.batch((batch) => batch.insertAll(_db.question, res));
  }

  getAllQuestions() async{
    return await (_db.select(_db.question)).get();
  }

  Future<List<QuestionData>> getQuestionsByShift(String guid, int deptid, bool isNightShift) async{
    return await (_db.select(_db.question)..where((tbl) => tbl.guid.equals(guid) & tbl.auditid.equals(deptid) & tbl.isNightActivity.equals(isNightShift))).get();
  }

  getQuestions(String guid, int deptid,) async{
    return await (_db.select(_db.question)..where((tbl) => tbl.guid.equals(guid) & tbl.auditid.equals(deptid))).get();
  }

  getAllUnImageQuestions() async{
    return await (_db.select(_db.question)..where((tbl) => tbl.imageBase64.equals('') & tbl.questionimage.equals('').not())).get();
  }


  Future<QuestionData?> getSatSun(String guid) async{
    return await (_db.select(_db.question)..where((tbl) => tbl.guid.equals(guid))..limit(1)).getSingleOrNull();
  }

  deleteAll() async{
    await _db.delete(_db.question).go();
  }

}
