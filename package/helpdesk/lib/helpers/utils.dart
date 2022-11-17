import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i2iutils/widgets/button.dart';
import 'package:intl/intl.dart';

import 'color.dart';

final now = DateTime.now();
final formatter = DateFormat('dd MMM yyyy');
final sendFormatter = DateFormat('MM/dd/yyyy');

/*Future<bool> isNetConnected() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      showToastMsg('Check Your Internet Connection',
          title: 'Network Error', background: colorPrimary);
      return false;
    }
  } catch (_) {
    showToastMsg('Check Your Internet Connection',
        title: 'Network Error', background: colorPrimary);
    return false;
  }
}

showToastMsg(
  String msg, {
  String? title,
  Color? background,
}) {
  AdvanceSnackBar(
    message: msg,
    bgColor: background ?? const Color(0xFF323232),
    textColor: background != null ? Colors.white : const Color(0xFFffffff),
    isFixed: true,
    fontWeight: FontWeight.w400,
    textSize: 15,
  ).show(Get.context!);
}*/

//Today Date
String getTodayDate() {
  return getPastDay(0);
}

//Yesterday Date
String getYesterdayDate() {
  return getPastDay(1);
}

//Last 7 days
String getLastSevenDays() {
  return '${getPastDay(7)} - ${getPastDay(0)}';
}

//Last 30Days
String getLastThirtyDays() {
  return '${getPastDay(30)} - ${getPastDay(0)}';
}

String getPastDay(int day) {
  return formatter.format(now.subtract(Duration(days: day)));
}

int getId(Map<String, int> map, String selectedItem) {
  return map[selectedItem] ?? -1;
}

Future<DateTimeRange?> customDateRange(DateTimeRange? dates) async {
  return await showDateRangePicker(
    context: Get.context!,
    initialDateRange: dates,
    firstDate: DateTime(2020),
    lastDate: now,
    locale: const Locale('en', "IN"),
    fieldStartHintText: 'dd/MM/yyyy',
    fieldEndHintText: 'dd/MM/yyyy',
  );
}

void showUpdateDialog() {
  showDialog(
    context: Get.context!,
    builder: (BuildContext con) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/update.png',
                width: 150,
                height: 80,
              ),
              const Text(
                'New Update!',
                style: TextStyle(
                    fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Helpdesk new version is available on play store. Update your app now.',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                  buttonText: 'Update',
                  textSize: 12,
                  height: 35,
                  width: 80,
                  onPressed: () {})
            ],
          ),
        ),
      );
    },
  );
}
