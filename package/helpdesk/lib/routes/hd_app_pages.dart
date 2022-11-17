import 'package:get/get.dart';
import 'package:helpdesk/screens/b2c/b2c_dahboard_screen.dart';
import 'package:helpdesk/screens/b2c_dashboard/b2c_home_screen.dart';
import 'package:helpdesk/screens/create/ticket_create_screen.dart';
import 'package:helpdesk/screens/detail/helpdesk_details.dart';
import 'package:helpdesk/screens/feedback/feedback_screen.dart';
import 'package:helpdesk/screens/home/home_screen.dart';
import 'package:helpdesk/screens/tickets/ticket_screen.dart';

import 'hd_app_routes.dart';

class HDAppRoutes {
  static final routes = [
    GetPage(
      name: HDRoutes.HOME,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: HDRoutes.B2C_DASHBOARD,
      page: () => B2CHomeScreen(),
    ),
    GetPage(
      name: HDRoutes.FEEDBACK,
      page: () => FeedbackScreen(),
    ),
    GetPage(
      name: HDRoutes.TICKETS,
      page: () => TicketScreen(),
    ),
    GetPage(
      name: HDRoutes.TICKET_DETAIL,
      page: () => HelpdeskDetail(),
    ),
    GetPage(
      name: HDRoutes.TICKET_CREATE,
      page: () => TicketCreateScreen(),
    ),
    GetPage(
      name: HDRoutes.B2C_HOME,
      page: () => B2CDashboardScreen(),
    ),
  ];
}
