import 'package:get/get_navigation/get_navigation.dart';
import 'package:pas_mobile_11pplg1_26/bindings/loginapi_binding.dart';
import 'package:pas_mobile_11pplg1_26/bindings/register_binding.dart';
import 'package:pas_mobile_11pplg1_26/bindings/splashscreen_binding.dart';
import 'package:pas_mobile_11pplg1_26/page/home_page.dart';
import 'package:pas_mobile_11pplg1_26/page/loginapi_page.dart';
import 'package:pas_mobile_11pplg1_26/page/register_page.dart';
import 'package:pas_mobile_11pplg1_26/page/splashscreen_page.dart';
import 'package:pas_mobile_11pplg1_26/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.homepage, page: () => HomePage()),
    GetPage(
      name: AppRoutes.registerapi,
      binding: RegisterapiBinding(),
      page: () => RegisterapiPage(),
    ),
    GetPage(
      name: AppRoutes.loginapi,
      binding: LoginApiBinding(),
      page: () => LoginApiPage(),
    ),
    GetPage(
      name: AppRoutes.splashscreen,
      binding: SplashscreenBinding(),
      page: () => SplashscreenPage(),
    ),
  ];
}