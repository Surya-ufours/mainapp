
import 'package:drift/drift.dart';
import '../../model/parameters.dart';
import '../database.dart';

class ParameterDao{
  final GCAppDb _db;
  ParameterDao(this._db);


  insert(List<ParameterCompanion> res) async{
    await _db.batch((batch) => batch.insertAll(_db.parameter, res));
  }

  getAllParameter() async{
    return await _db.select(_db.parameter).get();
  }

  Future<List<Parameter>> getParameters(String barcode, int templateId, int equipmentnameid) async{
    //using group by equipmentParamId
    return await _db.customSelect(
      "SELECT * FROM parameter WHERE guid=? AND equipmenttemplateid=? AND equipmentnameid=? GROUP BY equipmentparamid",
      variables: [
        Variable.withString(barcode),
        Variable.withInt(templateId),
        Variable.withInt(equipmentnameid)
      ],
      readsFrom: {_db.parameter},
    ).map((res) {

      return Parameter.fromJson(res.data);
    }).get();

  }

  deleteAll() async{
    await _db.delete(_db.parameter).go();
  }

}
