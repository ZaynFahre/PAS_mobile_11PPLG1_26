import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_26/controller/register_controller.dart';

class RegisterapiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterapiController>(() => RegisterapiController());
  }

}