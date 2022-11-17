import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'color.dart';

void showLoader({String? title}) {
  showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    color: colorPrimary,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    title ?? 'Please wait',
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        );
      });
}

void hideLoader() {
  Get.back(); //close the dialoge
}
