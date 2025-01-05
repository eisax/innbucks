import 'package:get/get.dart';
import 'package:innbucks/view/screens/auth/authscreen.dart';
import 'package:innbucks/view/screens/auth/widgets/signupscreen.dart';
import 'package:innbucks/view/screens/splash/splashscreen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String auth = '/auth';
  static const String register = '/register';
  static const String dashboard = '/dashboard';
  static const String profile = '/profile';
  static const String search = '/search';
  static const String category = '/category';
  static const String shopdashboard = '/shopdashboard';

  static getInitialRoute() => initial;
  static getSplashRoute() => splash;
  static getAuthRoute(String name) => '$auth?name=$name';
  static getRegisterRoute(String name) => '$register?name=$name';
  static getDashboardRoute(String name) => '$dashboard?name=$name';
  static getProfileRoute(String name) => '$profile?name=$name';
  static getSearchRoute(String name) => '$search?name=$name';
  static getCategoryRoute(String name) => '$category?name=$name';
  static getShopDashboardRoute(String name) => '$shopdashboard?name=$name';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const SplashScreen()),
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(
      name: auth,
      page: () => const AuthScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: register,
      page: () =>  Registration(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 300),
    ),
   
  ];
}
