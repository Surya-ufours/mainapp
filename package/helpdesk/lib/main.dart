/*
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpdesk/helpers/notification.dart';

import 'helpers/color.dart';
import 'routes/main_app_pages.dart';
import 'routes/main_app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await FirebaseNotification().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'HelpDesk',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: colorPrimary),
        primaryColor: colorPrimary,
        checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateProperty.all(colorPrimary)),
        primarySwatch: const MaterialColor(
          0xffe30000,
          // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
          <int, Color>{
            50: Color(0xffe30000), //10%
            100: Color(0xffe30000), //20%
            200: Color(0xffe30000), //30%
            300: Color(0xffe30000), //40%
            400: Color(0xffe30000), //50%
            500: Color(0xffdc0000), //60%
            600: Color(0xffd90000), //70%
            700: Color(0xffde0000), //80%
            800: Color(0xffd50000), //90%
            900: Color(0xffc10000), //100%
          },
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
*/
