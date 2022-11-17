
import 'package:drift/drift.dart';
import '../../model/user_response.dart';
import '../database.dart';

class UserDao{
  final GCAppDb _db;
  UserDao(this._db);

  Future<UserData?> getUser(String userName, String password) async{
    return await (_db.select(_db.user)
          ..where((tbl) =>
              tbl.emailid.equals(userName) & tbl.password.equals(password))
    )
        .getSingleOrNull();
  }

  getUserById(String userId) async{
    return await (_db.select(_db.user)
      ..where((tbl) =>
      tbl.userID.equals(userId)))
        .getSingleOrNull();
  }

  insertUser(ApiUser user, String password) async{
    await _db.into(_db.user).insert(UserCompanion.insert(
        AppTypes: user.appTypes,
        ProductID: user.productID,
        Language: user.language,
        RoleShortName: user.roleShortName,
        mobileno: user.mobileno,
        emailid: user.emailid,
        name: user.name,
        islogsheet: user.islogsheet,
        isadmin: user.isAdmin,
        ishelpdesk: user.isHelpdesk,
        ischecklist: user.ischecklist,
        locationame: user.locationame,
        companylogo: user.companylogo.replaceAll("http", "https"),
        companyName: user.companyName,
        userID: user.userID,
        password: password,
        locationID: user.locationID,
        CompanyID: user.companyID,
        Department: user.department));
  }

  deleteUsers() async{
    await _db.delete(_db.user).go();
  }

  updateDepartment(String departments) {
    return _db.update(_db.user)..write(UserCompanion(Department: Value(departments)));
  }
}
