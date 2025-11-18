import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_26/controller/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
  }

}