import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:helpdesk/api/helpdesk_api_calls.dart';
import 'package:helpdesk/helpers/strings.dart';
import 'package:helpdesk/helpers/utils.dart';
import 'package:helpdesk/model/feedback_tickets_response.dart';
import 'package:i2iutils/helpers/common_functions.dart';

class FeedbackController extends GetxController {
  RxList<Feedbackdetails> ticketDetails = RxList(Get.arguments.feedbackdetails);
  List<FeedbackScoreDetails> feedbackScoreDetails =
      Get.arguments.feedbackScoredetails;

  RxBool isLoading = false.obs;

  final _box = GetStorage();

  submitFeedback(Feedbackdetails details) async {
    Get.focusScope?.unfocus();
    if (details.selectedId.value == 0) return;
    if (await isNetConnected()) {
      isLoading(true);
      var params = {
        "Id": "0",
        "requesterid": '${_box.read(USER_ID)}',
        "ticketId": '${details.compliantID}',
        "requestername": _box.read(EMP_NAME),
        "email": _box.read(USER_EMAIL),
        "questionid": '0',
        "ratingpoint": '${details.selectedId}',
        "comments": details.comment,
        "feedbackDate": '',
      };

      var response = await HelpdeskApiCall().insertFeedback(params);
      if (response != null) {
        showToastMsg('${response['Message']}');
        if (response['Status']) {
          ticketDetails.remove(details);
        }
      }
      isLoading(false);
    }
  }
}
