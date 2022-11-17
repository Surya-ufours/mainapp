import 'package:get/route_manager.dart';
import 'package:mainapp/screens/splash_screen.dart';
import '../routes/main_app_pages.dart';
import '../screens/login/login_screen.dart';
import '../screens/main/main_screen.dart';

class MainAppRoutes {
  static final routes = [
    GetPage(
      name: MainRoutes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: MainRoutes.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: MainRoutes.home,
      page: () => MainScreen(),
    ),
      ];
}
