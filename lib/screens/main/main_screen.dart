import 'package:flutter/material.dart';
import 'package:helpdesk/helpers/color.dart';
import 'package:mainapp/screens/dashboard/dashboard_page.dart';
import 'package:mainapp/screens/profile/profile_page.dart';

import '../home/home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController page = PageController(initialPage: 0);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        children: [
          PageView(
            controller: page,
            physics: const NeverScrollableScrollPhysics(),
            children: [HomePage(), DashboardPage(), ProfilePage()],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              width: 200,
              margin: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(pageIndex == 0
                        ? Icons.home_rounded
                        : Icons.home_outlined),
                    disabledColor: Colors.black,
                    onPressed: pageIndex == 0
                        ? null
                        : () {
                            setState(() {
                              pageIndex = 0;
                              page.jumpToPage(0);
                            });
                          },
                  ),
                  IconButton(
                    icon: Icon(pageIndex == 1
                        ? Icons.pie_chart_rounded
                        : Icons.pie_chart_outline_rounded),
                    disabledColor: Colors.black,
                    onPressed: pageIndex == 1
                        ? null
                        : () {
                            setState(() {
                              pageIndex = 1;
                              page.jumpToPage(1);
                            });
                          },
                  ),
                  IconButton(
                    icon: Icon(pageIndex == 2
                        ? Icons.person_rounded
                        : Icons.person_outline_rounded),
                    disabledColor: Colors.black,
                    onPressed: pageIndex == 2
                        ? null
                        : () {
                            setState(() {
                              pageIndex = 2;
                              page.jumpToPage(2);
                            });
                          },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      /*bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'Home',activeIcon: Icon(Icons.home_filled)),
        BottomNavigationBarItem(icon: Icon(Icons.offline_bolt_outlined),label: 'Offline',activeIcon: Icon(Icons.offline_bolt)),
        BottomNavigationBarItem(icon: Icon(Icons.notifications_none_rounded),label: 'Notification',activeIcon: Icon(Icons.notifications)),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded),label: 'Profile',activeIcon: Icon(Icons.person)),
      ]),*/
    );
  }
}

/*Container(
                  color: Colors.grey.shade200,
                  width: Get.width,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  padding: const EdgeInsets.all(6),
                  height: 45,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.search,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: Text(
                        'search apps',
                        style: TextStyle(color: Colors.black45),
                      )),
                      VerticalDivider(
                        color: Colors.black38,
                      ),
                      Icon(
                        Icons.filter_alt_rounded,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),*/
