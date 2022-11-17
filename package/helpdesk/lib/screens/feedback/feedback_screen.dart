import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpdesk/helpers/color.dart';
import 'package:helpdesk/model/feedback_tickets_response.dart';
import 'package:helpdesk/screens/feedback/feedback_controller.dart';
import 'package:i2iutils/widgets/boxedittext.dart';
import 'package:i2iutils/widgets/button.dart';

class FeedbackScreen extends GetView<FeedbackController> {
  FeedbackScreen({Key? key}) : super(key: key);

  @override
  final controller = Get.put(FeedbackController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Feedback'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Get.back(result: controller.ticketDetails);
          return false;
        },
        child: Stack(
          children: [
            Obx(
              () => controller.ticketDetails.isEmpty
                  ? const Center(child: Text('No Tickets Found'))
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.ticketDetails.length,
                      itemBuilder: (_, index) {
                        Feedbackdetails details =
                            controller.ticketDetails[index];
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                _buildRow('Ticket No', details.ticketNo),
                                _buildRow('Request Date&Time', details.reqTime),
                                _buildRow('Closed Date&Time',
                                    details.closedTime ?? ''),
                                _buildRow('Complaint Nature',
                                    '${details.departmentName} / ${details.categoryName}'),
                                const SizedBox(
                                  height: 12,
                                ),
                                controller.feedbackScoreDetails.isEmpty
                                    ? const SizedBox.shrink()
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: List.generate(
                                            controller.feedbackScoreDetails
                                                .length, (index) {
                                          var score = controller
                                              .feedbackScoreDetails[index];
                                          return Obx(
                                            () => GestureDetector(
                                              onTap: () {
                                                details
                                                    .selectedId(score.scoreID);
                                                details
                                                    .isComment(score.isComment);
                                              },
                                              child: Column(
                                                children: [
                                                  Text(
                                                    score.scoreName,
                                                    style: TextStyle(
                                                        color: details
                                                                    .selectedId
                                                                    .value ==
                                                                score.scoreID
                                                            ? Colors.amber
                                                            : Colors.white),
                                                  ),
                                                  CachedNetworkImage(
                                                    imageUrl: details.selectedId
                                                                .value ==
                                                            score.scoreID
                                                        ? score.scoreImage
                                                        : score.scoreImageGray,
                                                    height: 30,
                                                    width: 30,
                                                    errorWidget: (_, __, ___) =>
                                                        const Icon(Icons.error,
                                                            size: 30),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                Obx(() => details.isComment.value
                                    ? Padding(
                                        padding: const EdgeInsets.only(top: 16),
                                        child: BoxEditText(
                                          placeholder: 'Enter Comments',
                                          maxLines: 3,
                                          onChanged: (str) {
                                            details.comment = str;
                                          },
                                        ),
                                      )
                                    : const SizedBox.shrink()),
                                Obx(
                                  () => details.selectedId.value == 0
                                      ? const SizedBox.shrink()
                                      : Padding(
                                          padding:
                                              const EdgeInsets.only(top: 32),
                                          child: CustomButton(
                                            width: 100,
                                            buttonText: 'Submit',
                                            onPressed: () => controller
                                                .submitFeedback(details),
                                            textSize: 13,
                                            height: 28,
                                          ),
                                        ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
            ),
            Obx(
              () => controller.isLoading.value
                  ? Container(
                      width: Get.width,
                      height: Get.height,
                      color: Colors.white60,
                      child: const Center(
                          child: CircularProgressIndicator(
                        color: colorPrimary,
                      )),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  _buildRow(String t, String v) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(t)),
        Expanded(
            child: Text(
          v,
          style: const TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.end,
        )),
      ],
    );
  }
}
