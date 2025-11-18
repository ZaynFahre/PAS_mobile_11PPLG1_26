import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_26/controller/auth_controller.dart';

class LoginApiBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }

}