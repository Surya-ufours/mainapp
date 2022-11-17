import '../../api/api_calls.dart';


import '../../database/dao/checklist_transaction_dao.dart';
import '../../database/dao/logsheet_transaction_dao.dart';

typedef OnCompleteFunc=Function();
typedef OnErrorFunc=Function(String);

class SyncData{

  final ChecklistTransactionDao checklistDao;
  final LogsheetTransactionDao logsheetDao;
  final Map<String,dynamic> extraParams;
  final OnCompleteFunc onComplete;
  final OnErrorFunc errorFunc;

  SyncData(this.checklistDao, this.logsheetDao, this.extraParams,this.onComplete, this.errorFunc);

  execute() async{
    var checklists=await checklistDao.getAllChecklistTransaction();
    var logsheets=await logsheetDao.getAllLogsheetTransaction();

    if(checklists.isNotEmpty){
      for (var element in checklists){

        var params=element.toJson();
        params.addAll(extraParams);

        var response=await ApiCall().submitChecklist(params);
        if(response!=null){
          if(response['status']) {
            // var guid=response['result']['deviceguid'];
            // checklistDao.updateChecklistTransaction(element.guid);
            errorFunc(response['message']);

          }else{
            errorFunc(response['message']);
          }
        }else{
          errorFunc('Something wrong');
        }

      }
    }

    checklistDao.updateIsSyncing();

    if(logsheets.isNotEmpty){
      for (var element in logsheets) {

        var params=element.toJson();
        params.addAll(extraParams);

        var response=await ApiCall().submitLogsheet(params);
        if(response!=null){
          if(response['status']) {
            // var guid=response['result']['deviceguid'];
            // logsheetDao.updateLogsheetTransaction(element.guid);
            errorFunc(response['message']);

          }else{
            errorFunc(response['message']);
          }
        }else{
          errorFunc('Something wrong');
        }

      }
    }

    logsheetDao.updateIsSyncing();

    onComplete();

  }

}