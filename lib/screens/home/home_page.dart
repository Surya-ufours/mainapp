import 'package:cached_network_image/cached_network_image.dart';
import 'package:checklist/routes/gc_app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainapp/helper/constants.dart';
import 'package:mainapp/screens/home/home_page_controller.dart';

import '../../helper/color.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({Key? key}) : super(key: key);

  @override
  final controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: yellow,
          padding:
              const EdgeInsets.only(top: 45, left: 12, right: 12, bottom: 12),
          child: Row(
            children: [
              Expanded(
                  child: Row(
                children: [
                  const Icon(
                    Icons.pin_drop_sharp,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Company',
                        style: TextStyle(fontSize: 10),
                      ),
                      Row(
                        children: const [
                          Text('I2I Software Solution'),
                          SizedBox(
                            width: 6,
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            size: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
              Stack(
                children: [
                  Positioned(
                      right: 0,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                      )),
                  const Icon(Icons.notifications_rounded),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  width: Get.width,
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          children: [
                            Chip(
                                label: const Text(
                                  'My Tickets',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                                avatar: Image.asset(
                                  'assets/logo.png',
                                  width: 14,
                                  height: 14,
                                ),
                                backgroundColor: Colors.green),
                            const SizedBox(
                              width: 8,
                            ),
                            Chip(
                                label: const Text(
                                  'Upcoming Visitors',
                                  style: TextStyle(fontSize: 10),
                                ),
                                avatar: Image.asset(
                                  'assets/logo.png',
                                  width: 14,
                                  height: 14,
                                ),
                                backgroundColor: Colors.grey.shade200),
                            const SizedBox(
                              width: 8,
                            ),
                            Chip(
                                label: const Text(
                                  "Todo's",
                                  style: TextStyle(fontSize: 10),
                                ),
                                avatar: Image.asset(
                                  'assets/logo.png',
                                  width: 14,
                                  height: 14,
                                ),
                                backgroundColor: Colors.grey.shade200),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                            imageUrl:
                                'https://thehardcopy.co/wp-content/uploads/Swiggy-Instamart-Design-Process-.jpg',
                            fit: BoxFit.cover,
                            width: Get.width,
                            height: 150),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: Get.width,
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "App's you have",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                      const Text(
                        "3 Apps",
                        style: TextStyle(fontSize: 10),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                        onTap: ()=>Get.toNamed(GCRoutes.home),
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(top: 35),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'GreenChecklist',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        letterSpacing: 1.5),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: const [
                                          Text(
                                            'Checklist',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            '73',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: const [
                                          Text(
                                            'Logsheet',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            '12',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 15,
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://play-lh.googleusercontent.com/seI95HZ6vY9kdKolNeZnMy0FNZPBf58r6nETRahPa7KaDQMizoc4ebw_AAzubxY500P5=w240-h480-rw',
                                width: 60,
                                height: 80,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(top: 35),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '52 Week PPM',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      letterSpacing: 1.5),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: const [
                                        Text(
                                          'Offline Asset',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          '73',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: const [
                                        Text(
                                          'Breakdowns',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          '12',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 15,
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://play-lh.googleusercontent.com/wPKbjl6jk5vyyYhMm-rNisI43izsGMKPLDRK-PphIRogAoeF_ouqXIriUNJz-JhtBSQ=w240-h480-rw',
                              width: 60,
                              height: 80,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(top: 35),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'VMS',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      letterSpacing: 1.5),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: const [
                                        Text(
                                          'Visitor IN',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          '102',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: const [
                                        Text(
                                          'Upcoming Visitors',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          '120',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 15,
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://play-lh.googleusercontent.com/ZCDppZfrCfSenaT3IVyq50rkKrwI2a-IIjGZDqxaDbLoAs_E9kAQqS2I3_2y6TuZNkI=w240-h480-rw',
                              width: 60,
                              height: 80,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: Get.width,
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Other Solution's",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                      const Text(
                        "You may be interested in",
                        style: TextStyle(fontSize: 10),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      GridView.count(
                        crossAxisCount: 4,
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 6,
                        childAspectRatio: 0.9,
                        padding: const EdgeInsets.all(4),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: ourApps
                            .map((e) => Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.blueGrey,
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                              e['appIcon'].toString()),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      e['appName'].toString(),
                                      style: const TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700),
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
