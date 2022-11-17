import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i2iutils/widgets/button.dart';

import '../../helpers/colors.dart';
import '../../helpers/session.dart';
import '../../routes/gc_app_pages.dart';
import 'download_controller.dart';

class DownloadScreen extends GetView<DownloadController> {
  DownloadScreen({Key? key}) : super(key: key);

  @override
  final controller = Get.put(DownloadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        title: const Text('Download'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CachedNetworkImage(
              imageUrl: controller.box.read(Session.userCompanyLogo),
              width: 60,
              errorWidget: (_, __, ___) {
                return Image.asset(
                  'assets/logo.png',
                  width: 25,
                  height: 25,
                );
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Downloading database',
              style: TextStyle(fontSize: 15),
            ),
            Container(
              width: 50,
              height: 2,
              decoration: BoxDecoration(
                  color: colorPrimary, borderRadius: BorderRadius.circular(8)),
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Obx(
                      () => ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.downloads.length,
                          itemBuilder: (_, index) {
                            return _buildDownloads(controller.downloads[index]);
                          }),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Obx(
                          () => CustomButton(
                              width: 120,
                              margin: const EdgeInsets.all(16),
                              buttonText: 'Next',
                              onPressed: controller.isFinish.value
                                  ? () {
                                      controller.box.write(
                                          Session.isGreenchecklistHaveDB, true);
                                      Get.offAndToNamed(GCRoutes.home);
                                    }
                                  : null),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildDownloads(param) {
    return ListTile(
      dense: true,
      leading: Image.asset(
        'assets/${param['icon']}',
        width: 28,
      ),
      title: Text(param['name']),
      subtitle: LinearProgressIndicator(
        backgroundColor: param['color'].withAlpha(300),
        valueColor: param['value'] == null
            ? null
            : AlwaysStoppedAnimation(param['color']),
        value: param['value']?.toDouble(),
      ),
      trailing: param['tPath'] == null || param['tPath'].isEmpty
          ? const SizedBox.shrink()
          : InkWell(
              onTap: param['color'] != Colors.red
                  ? null
                  : () => controller.reDownload(),
              child: Image.asset(
                'assets/${param['tPath']}',
                width: 20,
                height: 20,
              ),
            ),
    );
  }
}
