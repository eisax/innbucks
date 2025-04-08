// ignore_for_file: prefer_const_constructors
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:innbucks/controller/theme_controller.dart';
import 'package:innbucks/helper/route_helper.dart';
import 'package:innbucks/theme/dark_theme.dart';
import 'package:innbucks/theme/light_theme.dart';
import 'package:innbucks/util/app_constants.dart';
import 'package:innbucks/view/screens/root/no_found_screen.dart';
import 'helper/di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> languages = await di.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(DevicePreview(
      enabled: true,
       builder: (BuildContext context) { return MyApp(); },));
  });
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (themeController) {
      return GetMaterialApp(
         useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        navigatorKey: Get.key,
        theme: themeController.darkTheme ? dark : light,
        fallbackLocale: Locale(
          AppConstants.languages[0].languageCode!,
          AppConstants.languages[0].countryCode,
        ),
        initialRoute: RouteHelper.splash,
        getPages: RouteHelper.routes,
        unknownRoute: GetPage(
          name: '/',
          page: () => const NotFoundScreen(),
        ),
        defaultTransition: Transition.topLevel,
        transitionDuration: const Duration(milliseconds: 500),
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
        ),
      );
    });
  }
}

