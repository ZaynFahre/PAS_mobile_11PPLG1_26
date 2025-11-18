import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_26/controller/auth_controller.dart';
import 'package:pas_mobile_11pplg1_26/helper/db_helper.dart';
import 'package:pas_mobile_11pplg1_26/routes/pages.dart';
import 'package:pas_mobile_11pplg1_26/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDb();
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PAS Mobile - Daftar Produk',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.SPLASH,
      getPages: AppPages.pages,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
    );
  }
}
