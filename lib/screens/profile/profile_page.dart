import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpdesk/helpers/color.dart';
import 'package:mainapp/screens/profile/profile_page_controller.dart';

class ProfilePage extends GetView<ProfilePageController> {
  ProfilePage({Key? key}) : super(key: key);

  @override
  final controller = Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          elevation: 0,
          backgroundColor: yellow,
          title: const Text(
            'Profile',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        Container(
          width: Get.width,
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: yellow.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                const BoxShadow(color: Colors.white, blurRadius: 1),
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 1.8,
                    offset: const Offset(-5, 3)),
                BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 1.8,
                    offset: const Offset(2, -5)),
              ]),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: colorPrimary,
                radius: 22,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: CachedNetworkImage(
                        imageUrl: '',
                        height: 30,
                        errorWidget: (_, __, ___) {
                          return Image.asset(
                            'assets/logo.png',
                            height: 20,
                            width: 20,
                          );
                        },
                      )),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SURYA',
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Ufours IT Solution',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                const BoxShadow(color: Colors.white, blurRadius: 1),
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 1.8,
                    offset: const Offset(-5, 3)),
                BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 1.8,
                    offset: const Offset(2, -5)),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('App Setting'),
              const Divider(),
              _buildMenu(
                'assets/logo.png',
                'Dashboard',
                () {},
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                const BoxShadow(color: Colors.white, blurRadius: 1),
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 1.8,
                    offset: const Offset(-5, 3)),
                BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 1.8,
                    offset: const Offset(2, -5)),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Setting'),
              const Divider(),
              _buildMenu(
                'assets/logo.png',
                'Notification',
                    () {},
              ),
              _buildMenu(
                'assets/logo.png',
                'Logout',
                    () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildMenu(String path, String title, Function() onTab,
      {Widget? trialingIcon, String? subTitle}) {
    return InkWell(
      onTap: ()=> onTab(),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              path,
              width: 20,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w700),
                        ),
                        (subTitle ?? '').isEmpty
                            ? const SizedBox.shrink()
                            : Text(
                                '$subTitle',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey),
                              ),
                      ],
                    ),
                  ),
                  trialingIcon ?? const SizedBox.shrink()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
