import 'package:get/route_manager.dart';
import '../routes/gc_app_pages.dart';
import '../screens/checklist/checklist_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/dashboard_detail/dashboard_detail_screen.dart';
import '../screens/download/download_screen.dart';
import '../screens/helpdesk/helpdesk_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/logsheet/logsheet_screen.dart';
import '../screens/todo/todo_screen.dart';
import '../screens/todo_detail/todo_detail_screen.dart';

class GCAppRoutes {
  static final routes = [
    GetPage(
      name: GCRoutes.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: GCRoutes.home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: GCRoutes.download,
      page: () => DownloadScreen(),
    ),
    GetPage(
      name: GCRoutes.helpdesk,
      page: () => HelpdeskScreen(),
    ),
    GetPage(
      name: GCRoutes.checklist,
      page: () => ChecklistScreen(),
    ),
    GetPage(
      name: GCRoutes.logsheet,
      page: () => LogsheetScreen(),
    ),
    GetPage(
      name: GCRoutes.todo,
      page: () => TodoScreen(),
    ),
    GetPage(
      name: GCRoutes.todoDetail,
      page: () => TodoDetailScreen(),
    ),
    GetPage(
      name: GCRoutes.dashboard,
      page: () => DashboardScreen(),
    ),
    GetPage(
      name: GCRoutes.dashboardDetail,
      page: () => DashboardDetailScreen(),
    ),
  ];
}
