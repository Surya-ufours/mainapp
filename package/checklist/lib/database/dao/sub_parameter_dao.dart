
import 'package:drift/drift.dart';
import '../../model/parameters.dart';
import '../database.dart';

class SubParameterDao{
  final GCAppDb _db;
  SubParameterDao(this._db);


  insert(List<SubParameterCompanion> res) async{
    await _db.batch((batch) => batch.insertAll(_db.subParameter, res));
  }

  getAllSubParameter() async{
    return await _db.select(_db.subParameter).get();
  }

  Future<List<Parameter>> getSubParameters(int templateId, int equipmentnameid, int equipmentparamid) async{
    //using group by equipmentParamId
    return await _db.customSelect(
      "SELECT * FROM SubParameter WHERE equipment_param_id=? AND equipment_template_id=? AND equipment_name_id=? GROUP BY equipment_param_id",
      variables: [
        Variable.withInt(equipmentparamid),
        Variable.withInt(templateId),
        Variable.withInt(equipmentnameid)
      ],
      readsFrom: {_db.subParameter},
    ).map((res) => Parameter.fromJson(res.data)).get();
  }

  deleteAll() async{
    await _db.delete(_db.subParameter).go();
  }

}
