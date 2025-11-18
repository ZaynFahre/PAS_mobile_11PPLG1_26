import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pas_mobile_11pplg1_26/page/favorite_page.dart';
import 'package:pas_mobile_11pplg1_26/page/home_page.dart';
import 'package:pas_mobile_11pplg1_26/page/login_page.dart';
import 'package:pas_mobile_11pplg1_26/page/profile_page.dart';
import 'package:pas_mobile_11pplg1_26/page/register_page.dart';
import 'package:pas_mobile_11pplg1_26/page/splashscreen_page.dart';
import 'package:pas_mobile_11pplg1_26/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.SPLASH, page: () => const SplashPage()),
    GetPage(name: AppRoutes.LOGIN, page: () => const LoginPage()),
    GetPage(name: AppRoutes.REGISTER, page: () => const RegisterPage()),
    GetPage(name: AppRoutes.HOME, page: () => const HomePage()),
    GetPage(name: AppRoutes.FAVORITES, page: () => const FavoritesPage()),
    GetPage(name: AppRoutes.PROFILE, page: () => const ProfilePage()),
  ];
}